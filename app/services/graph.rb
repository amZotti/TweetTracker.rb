class Graph
  require 'gruff'

  def self.generate_proportion_per_city(datasets)
    g = Gruff::Pie.new
    datasets.each do |data|
      g.data(data[:city], data[:count].to_i)
    end
    g.title = "Proportion of Tweets per City"
    g.theme = Gruff::Themes::PASTEL
    g.minimum_value = 0
    g
  end

  def self.generate_keyphrases_graph(city, datasets)
    g = Gruff::Bar.new
    datasets.each do |set|
      key, value = set.first
      g.data(key, value.to_i)
    end
    g.title = "Proportion of keywords for #{city.name}"
    g.theme = Gruff::Themes::PASTEL
    g.minimum_value = 0
    g
  end



end
