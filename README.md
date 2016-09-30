Integrations Engineer Coding Challenge
======================================

A small ruby program written for [Geckoboard](https://www.geckoboard.com/) that utilises an external Twitter API for analysis using their app.

Specification
-------------

API
----
1. Pulls data from an external API at some sort of regular interval.
2. Pushes that data up to our datasets API (also at a regular interval).

Widgets
-------

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

Demonstration
-------------
```
[2] pry(Request)> request.create_dataset
=> #<Geckoboard::Dataset:0x007fdafbb4cfe8
 @client=#<Geckoboard::DatasetsClient:0x007fdafb7dc958 @connection=#<Geckoboard::Connection:0x007fdafb40c828 @api_key="9f9ea329a7835d14531e342f8e5d3a90">>,
 @fields={"followers"=>{"type"=>"number", "name"=>"Follower count"}, "rate"=>{"type"=>"number", "name"=>"Follower rate"}, "tweets"=>{"type"=>"number", "name"=>"Tweet count"}},
 @id="twitter.data">
[3] pry(Request)>
```
Future implementations
----------------------
