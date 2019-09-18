require_relative 'city_id_reader'

BASE_URL = 'http://api.openweathermap.org/data/2.5/weather'
ID = '1854345'

require 'json'
require 'open-uri'

def get_location_weather_by_cityid
  reader = CityIdReader.new
  parse_text = reader.read_city_id
  parse_text.each do |city|
    if city['country'] == 'JP'
      puts city['id']
      puts city['name']
    end
  end

  api_key = ENV['OPENWEATHERMAP_API_KEY']
  response = open(BASE_URL + "?id=#{ID}&APPID=#{api_key}")
  puts JSON.pretty_generate(JSON.parse(response.read))
end

get_location_weather_by_cityid
