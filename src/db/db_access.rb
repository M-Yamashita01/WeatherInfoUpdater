require 'mysql2'
require 'time'

class DBAccess
  def initialize
    user_name = ENV['MYSQL_USER_DEVELOPMENT']
    password = ENV['MYSQL_PASS_DEVELOPMENT']

    @client = Mysql2::Client.new(host: 'localhost', username: user_name, password: password)
  end

  def execute_query(query)
    return @client.query(query)
  end

  def insert_weathermap_location(city_id, latitude, longitude, city_name)
    current_datetime = Time.now.strftime('%Y-%m-%d %H:%M:%S')
    statement = @client.prepare('INSERT INTO weathermap_locations (city_id, latitude, longitude, city_name, created_at, updated_at) VALUES(?, ?, ?, ?, ?, ?)')
    statement.execute(city_id, latitude, longitude, city_name, current_datetime, current_datetime)
  end

  def insert_weather_group(weather_group_id, weather_icon, weather_main, weather_description)
    current_datetime = Time.now.strftime('%Y-%m-%d %H:%M:%S')
    @client.prepare('INSERT INTO weather_groups (weather_group_id, weather_icon, weather_main, weather_description, created_at, updated_at) VALUES(?, ?, ?, ?, ?, ?)')
    statement.execute(weather_group_id, weather_icon, weather_main, weather_description, current_datetime, current_datetime)
  end
end
