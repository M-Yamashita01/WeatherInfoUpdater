require 'json'
class CityIdReader
  def read_city_id
    file_path = File.expand_path('city.list.json', __dir__)
    parse_text = ''
    File.open(file_path, 'r') do |text|
      parse_text = JSON.parse(text.read)
    end

    return parse_text
  end
end
