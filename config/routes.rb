Rails.application.routes.draw do
  get 'graphs/generate/per_city' => "graphs#tweet_proportion_per_city"
  get 'graphs/generate/keywords/:slug' => "graphs#tweet_keyword_per_city"
end
