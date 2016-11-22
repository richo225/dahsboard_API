require_relative "lib/request.rb"
require_relative "lib/twitter_api.rb"
require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.every '10s' do
  twitter_data = TwitterApi.new
  request = Request.new(twitter_data)
  request.create_dataset
  request.update_dataset
end

scheduler.join
