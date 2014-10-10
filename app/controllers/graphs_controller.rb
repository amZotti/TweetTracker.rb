class GraphsController < ApplicationController

  before_action :get_city, only: [:tweet_keyword_per_city]

  def index
  end

  def tweet_proportion_per_city
    datasets = CityStats.new.get_proportion_stats
    graph = Graph.generate_proportion_per_city(datasets)
    send_data(graph.to_blob, :disposition => 'inline', :type => 'image/png', :filename => "gruff.png")
  end

  def tweet_keyword_per_city
    datasets = CityStats.new.get_key_phrases_stats(@city)
    graph = Graph.generate_keyphrases_graph(@city, datasets)
    send_data(graph.to_blob, :disposition => 'inline', :type => 'image/png', :filename => "gruff.png")
  end

  private

  def get_city
    @city = City.find_by_slug(params[:slug])
  end

end
