class Gallicagram

	require 'open-uri'
	require 'cgi'
  
	# query = string or array of strings
	# corpus = ["lemonde","livres","presse"]
	# resolution = ["year", "month"]
	def self.search(query,corpus="lemonde",start_date="1900",end_date="2000",resolution="month",sum=false) 

		query = format_query(query, sum)

		# We search through the Gallicagram API
		url = "https://shiny.ens-paris-saclay.fr/guni/corpus=#{corpus}_#{query}_from=#{start_date}_to=#{end_date}"

		response = URI.open(url)

		return response.read # to read the output: CSV.parse(response.read)
  end
end

private

def format_query(query, sum)
	if query.kind_of?(Array)
		query_string = ""
		query.each_with_index do |word, i|
			word = CGI.escape(word.strip.gsub(" ", "%20"))
			if i == 0
				query_string = query_string + word
			else
				if sum == true 
					query_string = query_string + "+" + word
				else
					query_string = query_string + "&" + word
				end
			end
		end
	else
		query_string = CGI.escape(query.strip.gsub(" ", "%20"))
	end

	return query_string

end