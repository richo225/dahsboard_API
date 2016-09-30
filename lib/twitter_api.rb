require 'twitter'
require 'time_difference'
require 'dotenv'
require 'pry'
Dotenv.load

class TwitterApi
  attr_reader :client, :tweets, :dates, :twitter_data
  attr_writer :dates, :twitter_data

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
    @dates = tweets.map do |tweet|
      tweet.created_at
    end
  end

  def time_period
    TimeDifference.between(first_tweet,last_tweet).in_months.round
  end

  def follower_rate
    (get_followers.to_f / time_period).round(2)
  end

  def build_twitter_data
    get_dates
    @twitter_data = {
      followers: get_followers,
      tweets: get_tweets,
      rate: follower_rate
    }
  end

  private

  def first_tweet
    dates.first
  end

  def last_tweet
    dates.last
  end

  # binding.pry

end
