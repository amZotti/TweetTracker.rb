require 'redis'
class RedisClient

  attr_accessor :client

  def self.client
    @client ||= Redis.new
    @client
  end

end
