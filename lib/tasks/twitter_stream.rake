namespace :twitter do

  desc "Stream matching tweets into redis"
  task stream: :environment do

    LOCATIONS = [
                  "-115.136526",
                  "36.159293",
                  "-115.129494",
                  "36.170043"
                ]

    client = TwitterClient.client
    redis = RedisClient.client
    city = "las_vegas"

    unless redis.exists city
      redis.set city, 0
    end

    TwitterStream.new(client).filter(LOCATIONS) do |tweet|
      redis.incr city
      puts tweet.text
    end

  end

end
