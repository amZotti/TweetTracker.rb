class CityDataCatcher

  def self.catch_async(city, redis, client)
    Thread.new do
      city.keywords.each do |k|
        key = "#{city.slug}_#{k}"
        unless redis.exists key
          redis.set key, 0
        end
      end

      unless redis.exists city
        redis.set city.slug, 0
      end

      TwitterStream.new(client).filter(city.location) do |tweet|
        redis.incr city.slug

        text = tweet.text.gsub(/[^a-z ]/i, '')

        # Split the tweet into words
        words = text.split
        # Perform a union on the city keyphrases array
        # and the words in the tweet to find matching
        # pairs.
        keyphrase_matches = words & city.keywords
        if keyphrase_matches

          keyphrase_matches.each do |keyphrase|

            key = "#{city.slug}_#{keyphrase}"
            redis.incr key

            puts "Found match for #{key}:"
            puts tweet.text
          end
        end

      end
    end
  end

end
