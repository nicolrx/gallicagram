class Gallicagram

	require 'open-uri'
	require 'cgi'
	require 'csv'
  
	# query = string or array of strings
	# corpus = ["lemonde","livres","presse"]
	# resolution = ["year", "month"]
	def self.search(query,corpus="lemonde",start_date="1900",end_date="2000",resolution="month",sum=false)

		query = [query] unless query.kind_of?(Array)
		output = ""
		query.each_with_index do |word, index|
			query = format_query(word, sum)
			response = call_api(word, corpus, start_date, end_date)
			unless index == 0
				response = response.gsub("n,gram,annee,mois,jour,total", "\n").strip
			end
			output << response
		end

		if corpus == "livres" && resolution == "month"
			resolution = "year"
		end

		data = group_by_resolution(output, resolution)

		return data
	end
end

private

def format_query(query, sum)
	
	query_string = CGI.escape(query.strip.gsub(" ", "%20"))

	return query_string

end

def call_api(query, corpus, start_date, end_date)
	# We search through the Gallicagram API
	url = "https://shiny.ens-paris-saclay.fr/guni/query?corpus=#{corpus}&mot=#{query}&from=#{start_date}to=#{end_date}"

	response = URI.open(url)

	return response.read
end

def group_by_resolution(data, resolution)
	csv_parsing = CSV.parse(data, :headers => true)
	clean_data_array = []
	case resolution 
	when "year"
		csv_parsing.group_by { |word| [word["annee"], word["gram"]] }.each do |cp|
			sum = cp[1].sum { |word| word["total"].to_i }
			new_row = cp[0]
			new_row << sum
			clean_data_array << new_row
		end
	when "month"
		csv_parsing.group_by { |word| [word["annee"], word["mois"], word["gram"]] }.each do |cp|
			sum = cp[1].sum { |word| word["total"].to_i }
			new_row = cp[0]
			new_row << sum
			clean_data_array << new_row
		end
	end

	return clean_data_array
end