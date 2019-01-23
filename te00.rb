
require 'twitter'
require 'dotenv'
Dotenv.load


=begin

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
  config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
end

	
journaliste = ["@4473c422c321463", "@Thomas_LV1","@MrnAdrn"]
journaliste.each do |i|
client.update ("#{i} test Rubyy !!! ")
end 

=end

def login_twitter
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
    config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
    config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
    config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
  end
  return client
end

# clés d'API pour la fonction streaming
def streaming
  client = Twitter::Streaming::Client.new do |config|
    config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
    config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
    config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
    config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
  end
  return client
end
def follow_like_stream_hashtag(my_hashtag)
  topics = [my_hashtag]
  streaming.filter(track: topics.join(",")) do |tweet|
    if tweet.is_a?(Twitter::Tweet)
      puts tweet.text
      login_twitter.favorite(tweet)
      login_twitter.follow(tweet.user.screen_name)
    end
  end
end
follow_like_stream_hashtag("#bonjour_monde")


users =client.search('#bonjour_monde', result_type: "mixed").take(20)
	users.collect do |tweet|
		client.follow(tweet.user.screen_name)
		puts user
	end