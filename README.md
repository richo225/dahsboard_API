Integrations Engineer Coding Challenge
======================================

A small ruby command line program written for [Geckoboard](https://www.geckoboard.com/). The program pulls data from an external Twitter API and pushes it to the Geckoboard datasets API at regular intervals.

Installation
------------
Clone the repository:
```
$ git clone git@github.com:richo225/geckoboard_tech_test.git
$ cd geckoboard_tech_test
```
Get the required gems:
```
$ bundle install
```

Running the app
---------------
Run the quickstart file from the command line:
```
$ ruby quickstart.rb
```
The program is written in Ruby due to my familiarity with it and the ease with which I could design the program in an agile manner with seperate concerns etc. The main reason was also the wide range of gems available such as the twitter and the rufus-scheduler gem. The twitter gem adds a really handy ruby interface to the Twitter API that although clean and simple, did prove tricky to test. The rufus-scheduler gem allows the code in the quickstart.rb file to be run every 3s which can be modified easily.

The program begins in the quickstart.rb file where a request class is instantiated and a twitter_api object is injected into it. The request object then has access to all of the twitter methods such as follower_count and follower_rate which can then be used to build data for the dataset to be pushed up to the dashboard.

The advantage of writing this in ruby is that classes can be added easily that will represent different external API calls. Then it's just a matter of injecting these into the Request class to extend the program in the future.

Demonstration in Pry
-------------
```
[1] pry(Request)> request = Request.new(TwitterApi.new)
=> #<Request:0x007f9d2950ee20
 @client=#<Geckoboard::Client:0x007f9d2950ed08 @connection=#<Geckoboard::Connection:0x007f9d2950ebf0 @api_key="9f9ea329a7835d14531e342f8e5d3a90">>,
 @data=
  #<TwitterApi:0x007f9d29635600
   @client=
    #<Twitter::REST::Client:0x007f9d296355d8
       @url_prefix=#<URI::HTTPS https://api.twitter.com/>>,

[2] pry(Request)> request.data.get_followers
=> 19

[3] pry(Request)> request.data.get_tweets
=> 14

[4] pry(Request)> request.data.get_dates
=> [2016-09-28 22:07:10 +0000,
 2016-09-28 10:50:30 +0000,
 2016-09-28 10:46:26 +0000,
 2016-09-27 10:34:13 +0000,
 2016-08-02 17:15:12 +0000,
 2016-07-11 17:42:34 +0000,
 2016-06-21 19:30:16 +0000,
 2016-06-06 15:24:30 +0000,
 2016-06-02 00:43:12 +0000,
 2016-05-26 14:52:13 +0000,
 2016-05-23 23:11:40 +0000,
 2016-05-20 13:37:37 +0000,
 2016-04-21 11:28:28 +0000,
 2016-03-09 01:46:19 +0000]

[5] pry(Request)> request.data.follower_rate
=> 2.71

[6] pry(Request)> request.create_dataset
=> #<Geckoboard::Dataset:0x007f9d299b69f0
 @client=#<Geckoboard::DatasetsClient:0x007f9d2978c3f0 @connection=#<Geckoboard::Connection:0x007f9d2950ebf0 @api_key="9f9ea329a7835d14531e342f8e5d3a90">>,
 @fields={"followers"=>{"type"=>"number", "name"=>"Follower count"}, "rate"=>{"type"=>"number", "name"=>"Follower rate"}, "tweets"=>{"type"=>"number", "name"=>"Tweet count"}},
 @id="twitter.data">

[7] pry(Request)> request.data.build_twitter_data
=> {:followers=>19, :tweets=>14, :rate=>2.71}
```

Challenges
-----------
Most of my time was spent on testing the methods involved in the twitter gem API calls. I had no experience with VCR or WebMock before but they proved really useful in stopping the program reaching the Twitter API limit from running Rspec. The gems are involved in intercepting any API calls to twitter, saving them to a cassette in the spec folder which are then re-used in future Rspec runs. It was a great learning experience.

The program currently pulls twitter data at intervals and creates a dataset visible in the dashboard. Unfortunately, because of the time spent on testing, I am still yet to implement the dashboard widgets with data. This should be simple enough via the `put` method and playing around on the various dashboard app features.

NOTE - Any API keys or auth tokens are inside my .env file that are not committed. You will therefore need to provide your own API keys for twitter and geckoboard in order for the program to work. This is something I still need to change.

Future implementations
----------------------
Apart from the mentions previously, I would really like to implement more data types from the Twitter API. The list below shows the huge number of methods available and due to careful design, these methods can be easily added. This also means other API's can be used and injected into the request object. I chose twitter because it would be fun to work with my own account but it would also be interesting to work with more business-oriented API's. For example, [Amee](https://www.amee.com/api) have an API which provides emission, revenue and employee data on businesses.
