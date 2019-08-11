require 'net/http'
require 'uri'
require 'pry'
require 'open-uri'

require 'dotenv'

Dotenv.load('.env') #loads ENV variables from .env file

API_KEY = ENV['API_KEY']
IPIFY_KEY = ENV['IPIFY_KEY']

#Method to take user's input 
def user_input
  puts "What are you searching for?"
  keyword = gets.chomp
  puts "Enter radius in meters:" 
  radius = gets.chomp
  { keyword: keyword, radius: radius }
end

#Method to get location (Latitude and Longitude) of the user
def get_current_location 
  uri = URI("https://geo.ipify.org/api/v1?apiKey=#{IPIFY_KEY}")

  Net::HTTP.get(uri)
  response = Net::HTTP.get_response(uri)

  res_json = JSON.parse(response.body)

  latitude = res_json["location"]["lat"]
  longitude = res_json["location"]["lng"]
  {latitude: latitude, longitude: longitude}
end


queries = user_input
radius = queries[:radius]
keyword = queries[:keyword]
location = get_current_location
latitude = location[:latitude]
longitude = location[:longitude]




#set uri according to google maps API docs
uri = URI("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&radius=#{radius}&keyword=#{keyword}&key=#{API_KEY}")

#Hit the GET request 
Net::HTTP.get(uri)

#get the response back from API
response = Net::HTTP.get_response(uri)

#Parse the JSON response to a hash
response_hash =  JSON.parse(response.body)

#Hash of Array of Hashes 
response_hash["results"].each_with_index do |place, i|
  puts "#{i+1}. #{place["name"]}"
end

# https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=1500&type=restaurant&keyword=cruise&key=AIzaSyA3suZ8mO6MDirIA6FNypUHMc_a9KjyZ04
