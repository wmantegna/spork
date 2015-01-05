Yelp.configure(
  :consumer_key    => ENV['YELP_KEY'],
	:consumer_secret => ENV['YELP_SECRET'],
	:token           => ENV['YELP_TOKEN'],
	:token_secret    => ENV['YELP_TOKEN_SECRET']
)