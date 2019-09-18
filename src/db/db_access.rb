require 'mysql2'

class DBAccess
  def initialize
    user_name = ENV['MYSQL_USER_DEVELOPMENT']
    password = ENV['MYSQL_PASS_DEVELOPMENT']

    @client = Mysql2::Client.new(host: 'localhost', username: user_name, password: password)
  end

  def execute_query(query)
    return @client.query(query)
  end
end
