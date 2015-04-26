Rails.application.routes.draw do
  post '/movies/cast', to: 'movies#castImages', param: :name
  post '/movies', to: 'movies#search', param: :name
end
