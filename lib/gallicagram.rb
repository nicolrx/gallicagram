class Gallicagram

	require 'open-uri'
	require 'cgi'
	require 'csv'
  
	# query = string or array of strings
	# corpus = ["lemonde","livres","presse"]
	# resolution = ["mois", "annee"]
	def self.search(query,corpus="lemonde",start_date="1900",end_date="2000",resolution="annee",sum=false)

		query = [query] unless query.kind_of?(Array)
		output = ""
		query.each_with_index do |word, index|
			query = format_query(word, sum)
			if corpus == "livres" && resolution == "mois"
				resolution = "annee"
			end
			response = call_api(word, corpus, start_date, end_date, resolution)
			unless index == 0
				response = response.gsub("n,gram,annee,mois,jour,total", "\n").strip
			end
			output << response
		end

		data = CSV.parse(output, :headers => true)

		return data
	end
end

private

def format_query(query, sum)
	
	query_string = CGI.escape(query.strip.gsub(" ", "%20"))

	return query_string

end

def call_api(query, corpus, start_date, end_date, resolution)
	# We search through the Gallicagram API
	url = "https://shiny.ens-paris-saclay.fr/guni/query?corpus=#{corpus}&mot=#{CGI.escape(query)}&from=#{start_date}&to=#{end_date}&resolution=#{resolution}"

	response = URI.open(url)

	return response.read
end