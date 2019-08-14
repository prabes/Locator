class Locator
  API_KEY = ENV['API_KEY']

    def initialize(user_input, location)
      @input = user_input
      @location = location
    end

    def queries
      {keyword: @input.keyword, radius: @input.radius, lat: @location.latitude, lng: @location.longitude}
    end

    def set_uri
      #set uri according to google maps API docs
      uri = URI("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{queries[:lat]},#{queries[:lng]}&radius=#{queries[:radius]}&keyword=#{queries[:keyword]}&key=#{API_KEY}")
    end

end
