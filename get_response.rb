class GetResponse 

  def self.get(URI)

    #Hit the GET request 
    Net::HTTP.get(URI)

    #get the response back from API
    response = Net::HTTP.get_response(uri)

    #Parse the JSON response to a hash
    response_hash =  JSON.parse(response.body)
  end
end