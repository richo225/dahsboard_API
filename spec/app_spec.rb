require "app"
require "twitter"

describe TwitterApi do

  before :each do
    WebMock.disable_net_connect!
  end

  let(:twitter){TwitterApi.new}

  describe "#find_user" do
    it "returns the correct user object" do
      VCR.use_cassette("twitter/find_user") do
        user = twitter.find_user("Meister_Bates")
        expect(user.class).to eq(Twitter::User)
        expect(user.screen_name).to eq("Meister_Bates")
      end
    end
  end

  describe "#get_followers" do
    it "returns the total number of followers" do
      VCR.use_cassette("twitter/get_followers") do
        expect(twitter.get_followers).to eq(20)
      end
    end
  end

  describe "#get_tweets" do
    it "returns the total number of tweets" do
      VCR.use_cassette("twitter/get_tweets") do
        expect(twitter.get_tweets).to eq(twitter.tweets.size)
        expect(twitter.get_tweets).to eq(14)
      end
    end
  end

  describe "#get_dates" do
    it "returns a list of tweet dates" do
      VCR.use_cassette("twitter/get_dates") do
        expect(twitter.get_dates.size).to eq(twitter.tweets.size)
        # expect(twitter.get_dates).to all be_an_instance_of(DateTime)
      end
    end
  end


end
