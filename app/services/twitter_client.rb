require 'twitter'
class TwitterClient

  CONSUMER_KEY = 'L8das6tpNDWtgUnkrzZ1Orjai'
  CONSUMER_SECRET = '1eIqTYlUEdJC7aDnBNcixXbDVLJaKKb5UIxozw5DYf1EOpRRqa'
  ACCESS_TOKEN = '2651301248-Xj6sK1G6WTZMjs9ycxet7y7PD9IvcOhb0IXYAo4'
  ACCESS_TOKEN_SECRET = '5JtOEyXRrOng2G4W046F85utteBNED75ndEyKaWZnBWRs'
  attr_accessor :client

  def self.client
    @client ||= Twitter::Streaming::Client.new do |config|
      config.consumer_key = CONSUMER_KEY
      config.consumer_secret = CONSUMER_SECRET
      config.access_token = ACCESS_TOKEN
      config.access_token_secret = ACCESS_TOKEN_SECRET
    end
    @client
  end

end
