require "request"
require "twitter"

describe Request do

  before :each do
    WebMock.allow_net_connect!
  end

  let(:twitter){TwitterApi.new}
  let(:request){Request.new(twitter)}

  # describe "#create_dataset" do
  #   it "returns the correct hash dataset" do
  #     VCR.use_cassette("gecko/create_dataset") do
  #       expect(request.create_dataset.connect).to include(
  #       "name" => "Follower count",
  #       "name" => "Follower rate",
  #       "name" => "Tweet count")
  #     end
  #   end
  # end
end
