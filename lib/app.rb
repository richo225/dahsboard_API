require 'rubygems'
require 'twitter'
require 'dotenv'
require 'pry'
Dotenv.load

class TwitterApi
  attr_reader :client, :tweets

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV["CONSUMER_KEY"]
      config.consumer_secret = ENV["CONSUMER_SECRET"]
      config.access_token = ENV["ACCESS_TOKEN"]
      config.access_token_secret = ENV["ACCESS_SECRET"]
    end
    @tweets = client.user_timeline("Meister_Bates")
  end

  def find_user(username)
    client.user(username)
  end

  def get_followers
    client.user.followers_count
  end

  def get_tweets
    client.user.tweets_count
  end

  def get_dates
    tweets.map do |tweet|
      tweet.created_at.strftime("%d/%m/%Y")
    end
  end

  def get_first_tweet
    tweets.first
  end

  def get_last_tweet
    tweets.last
  end

  # binding.pry

end
