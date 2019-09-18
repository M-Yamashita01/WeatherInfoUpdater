require_relative 'city_id_reader'
require_relative 'current_weather'
require_relative 'current_weather_list'
require 'json'
require 'open-uri'

class CurrentWeathersGetter
  BASE_URL = 'http://api.openweathermap.org/data/2.5/weather'  

  def get_weather(city_id)
    api_key = ENV['OPENWEATHERMAP_API_KEY']
    response = open(BASE_URL + "?id=#{city_id}&APPID=#{api_key}")

    location_weather = JSON.parse(response.read)

    current_weather = CurrentWeather.new
    current_weather.longitude = location_weather['coord']['lon']
    current_weather.latitude = location_weather['coord']['lat']
    current_weather.city_id = location_weather['id']
    current_weather.city_name = location_weather['name']

    return current_weather
  end

  def get_city_id_list
    reader = CityIdReader.new
    city_list = reader.read_city_id
    return city_list
  end

  def get_weathers
    city_id = '1854345'
    weather = get_weather(city_id)
    weather_list = CurrentWeatherList.new
    weather_list.add(weather)
    return weather_list
  end
end
