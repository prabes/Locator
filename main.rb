require 'net/http'
require 'uri'
require 'pry'
require 'open-uri'

require 'dotenv'

Dotenv.load('.env') #loads ENV variables from .env file

require_relative 'current_location'
require_relative 'display'
require_relative 'locator'
require_relative 'user_input'

user_info = UserInput.new
location = CurrentLocation.new
locator = Locator.new(user_info, location)



Display.display(locator.search)