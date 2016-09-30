require_relative "lib/request.rb"
require_relative "lib/twitter_api.rb"

twitter_data = TwitterApi.new
request = Request.new(twitter_data)

request.create_dataset
request.update_dataset
