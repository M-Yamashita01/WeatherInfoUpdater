# require 'mysql2'
require_relative 'current_weathers_getter'
require_relative 'current_weather_list'
require_relative 'current_weather'
require_relative '../db/db_access'

current_weathers = CurrentWeathersGetter.new
current_weather_list = current_weathers.get_weathers
current_weather = current_weather_list.get

db_access = DBAccess.new
query = 'use weather_report_development;'

puts db_access.execute_query(query)

query = 'select * from locations;'

results = db_access.execute_query(query)

results.each do |row|
  puts row
end
