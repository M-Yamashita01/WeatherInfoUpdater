require_relative 'city_id_reader'

BASE_URL = 'http://api.openweathermap.org/data/2.5/weather'

require 'json'
require 'open-uri'

def get_location_weather(city_id)
  api_key = ENV['OPENWEATHERMAP_API_KEY']
  response = open(BASE_URL + "?id=#{city_id}&APPID=#{api_key}")
  # puts JSON.pretty_generate(JSON.parse(response.read))
  location_weather = JSON.parse(response.read)
  return location_weather
end

def get_city_id_list
  reader = CityIdReader.new
  city_list = reader.read_city_id
  return city_list
  # city_list.each do |city|
  #  if city['country'] == 'JP'
  #    puts city['id']
  #    puts city['name']
  #  end
  # end
end

def get_weathers
  city_id = '1854345'
  return get_location_weather(city_id)
end

puts get_weathers
