class City < ActiveRecord::Base
  def location
    self.coordinates.join(",")
  end
end
