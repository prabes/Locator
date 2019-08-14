class CurrentLocation 
  attr_accessor :latitude, :longitude
  IPIFY_KEY = ENV['IPIFY_KEY']
  
  def initialize
    uri = URI("https://geo.ipify.org/api/v1?apiKey=#{IPIFY_KEY}")

    Net::HTTP.get(uri)
    response = Net::HTTP.get_response(uri)

    res_json = JSON.parse(response.body)

    @latitude = res_json["location"]["lat"]
    @longitude = res_json["location"]["lng"]
  end
end


