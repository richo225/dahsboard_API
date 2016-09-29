require "app"
require "twitter"

describe TwitterApi do
  let(:twitter){TwitterApi.new}
  let(:user){twitter.find_user("Meister_Bates")}

  describe "#find_user" do
    it "returns the correct user object" do
      expect(user.class).to eq(Twitter::User)
      expect(user.screen_name).to eq("Meister_Bates")
    end
  end

  describe "#get_followers" do
    it "returns the total number of followers" do
      expect(twitter.get_followers).to eq(19)
    end
  end

  describe "#get_tweets" do
    it "returns the total number of tweets" do
      expect(twitter.get_tweets).to eq(twitter.tweets.size)
      expect(twitter.get_tweets).to eq(14)
    end
  end

  describe "#get_dates" do
    it "returns an array of tweet dates" do
      expect(twitter.get_dates.size).to eq(twitter.tweets.size)
      expect(twitter.get_dates).to all be_an_instance_of(Date)
    end
  end


end
