class TwitterStream

  attr_accessor :client, :locations

  def initialize(client)
    @client = client
  end

  def filter(location)
    @client.filter(:locations => location) do |tweet|
      yield tweet
    end
  end

end
