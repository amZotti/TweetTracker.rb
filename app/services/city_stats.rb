class CityStats

  def initialize
    @redis ||= RedisClient.client
  end

  def get_key_phrases_stats city
    city.keywords.map do |k|
      redis_key = "#{city.slug}_#{k.underscore}"
      { "#{k}" => @redis.get(redis_key) }
    end
  end

  def get_proportion_stats
    City.all.map do |city|
      { city: city.name, count: @redis.get(city.slug) }
    end
  end
end
