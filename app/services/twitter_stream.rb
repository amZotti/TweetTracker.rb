class TwitterStream

  attr_accessor :client, :locations

  def initialize(client)
    @client = client
  end

  def filter(locations)
    locations = locations.join(",")
    @client.filter(:locations => locations) do |tweet|
      yield tweet
    end
  end

end
