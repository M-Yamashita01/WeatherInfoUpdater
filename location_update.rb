require 'mysql2'
require_relative 'location_id_reader'
require_relative 'location_list'

file_path = File.expand_path('main_city.json', __dir__)

city_list = []

File.open(file_path, 'r') do |text|
  parse_text = JSON.parse(text.read)
  parse_text['city'].each { |city|
    city_list.push(city['name'])
  }
end

client = Mysql2::Client.new(host: 'localhost', username: 'mysql_user', password: 'mysql_user')
query = 'use weather_report_development;'
results = client.query(query)

city_list.each do |main_city|
  query = "update locations set main_city_flag = 1 where location_name = \"#{main_city}\""
  puts query
  results = client.query(query)
end
