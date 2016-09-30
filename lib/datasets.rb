require 'geckoboard'
require 'dotenv'
require 'pry'
Dotenv.load

@client = Geckoboard.client(ENV["GECKO_KEY"])

def create_dataset
  @dataset = @client.datasets.find_or_create("twitter.data", fields: [
    Geckoboard::NumberField.new(:followers, name: "Follower count"),
    Geckoboard::NumberField.new(:tweets, name: "Tweet count"),
    Geckoboard::NumberField.new(:rate, name: "Follower rate")
  ])
end

def update_dataset(twitter_data)
  @dataset.put(twitter_data)
end

binding pry
