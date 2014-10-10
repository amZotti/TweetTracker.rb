class CityDataCatcher


  def self.catch_async(city, redis, client)
    Thread.new do
      city.keywords.each do |k|
        key = "#{city.slug}_#{k.underscore}"
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
        matches = CityDataCatcher.keyphrase_matches(text, city.keywords)
        if matches.length > 0
          matches.each do |keyphrase|
            key = "#{city.slug}_#{keyphrase.underscore}"
            redis.incr key

            puts "Found match for #{key}:"
            puts tweet.text
          end
        end

      end
    end
  end

  def self.keyphrase_matches(text, selectors)
    result = []
    selectors.each do |selector|
      # Build a regular expression for the selector
      # and match against text. If it matches,
      # add it to the list of matched selectors.
      result << selector if text.match(/#{selector}/)
    end
    return result
  end

end
