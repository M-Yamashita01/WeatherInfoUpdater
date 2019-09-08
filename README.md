# WeatherInfoUpdater

## How to run
必要なパッケージのインストール
$ brew install mysql
$ yarn install

MySQL起動、database作成
$ mysql.server start
$ mysql -u root
mysql> create database weather_report_development;
Query OK, 1 row affected (0.01 sec)
$ bin/rails db:migrate RAILS_ENV=development

環境変数(MySQLのユーザ名、パスワード)をセット
$ export MYSQL_USER_DEVELOPMENT=MySQLユーザ名
$ export MYSQL_PASS_DEVELOPMENT=MySQLパスワード

地域情報をDBへ追加
$ ruby location_insert.rb

地域情報に主要都市情報を追加
$ ruby location_update.rb

各地域の3日間(今日、明日、明後日)の天気情報をDBへ追加
$ ruby location_weather_insert.rb

補足：
地域はお天気Webサービスに登録してある地点を使用している。
また天気情報はお天気Webサービスから取得している。
http://weather.livedoor.com/weather_hacks/webservice
