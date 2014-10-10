namespace :twitter do

  desc "Stream matching tweets into redis"
  task stream: :environment do

    redis = RedisClient.client
    client = TwitterClient.client
    threads = []
    City.all.each do |city|
      threads << CityDataCatcher.catch_async(
        city, redis, client
      )
    end
    threads.each {|t| t.join; puts "Joining Thread"  }
  end
end
