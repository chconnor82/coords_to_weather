require 'open-uri'
require 'json'

class CoordsController < ApplicationController
  def fetch_weather

    @address_1 = params[:address_1]
    @url_safe_address = URI.encode(@address_1)

    # Your code goes here.
    url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{@url_safe_address}&sensor=false"
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    @latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
    @longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

    # @latitude = 42.0538387
    # @longitude = -87.67721
    your_api_key = "809482e33d1875804a3daa461c6be8f3"

    url = "https://api.forecast.io/forecast/#{your_api_key}/#{@latitude},#{@longitude}"
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    @temperature = parsed_data["currently"]["temperature"]
    @minutely_summary = parsed_data["minutely"]["summary"]
    @hourly_summary = parsed_data["hourly"]["summary"]
    @daily_summary = parsed_data["daily"]["summary"]
  end
end


# require 'open-uri'
# require 'json'

# class AddressesController < ApplicationController
#   def fetch_coordinates
#     @address = "the corner of Foster and Sheridan"
#     @url_safe_address = URI.encode(@address)

#     # # Your code goes here.


# @url_safe_address = "http://maps.googleapis.com/maps/api/geocode/json?address=the+corner+of+foster+and+sheridan&sensor=false"
# # require 'open["URI.encode(@address)"]'
# raw_data = open(@url_safe_address).read
# parsed_data = JSON.parse(raw_data)

# @latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
# @longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

#  end
# end
