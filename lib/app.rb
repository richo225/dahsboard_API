require 'rubygems'
require "twitter"
require 'dotenv'
Dotenv.load

class TwitterFetcher

  client = Twitter::REST::Client.new do |config|
    config.consumer_key = ENV["CONSUMER_KEY"]
    config.consumer_secret = ENV["CONSUMER_SECRET"]
    config.access_token = ENV["ACCESS_TOKEN"]
    config.access_token_secret = ENV["ACCESS_SECRET"]
  end

  def get_followers
    client.user.followers_count
  end

  def get_tweets
    client.user.tweets_count
  end

  def get_mentions
    client.user.mentions_timeline
  end

end
