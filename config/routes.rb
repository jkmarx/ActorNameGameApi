Rails.application.routes.draw do
  post '/movies', to: 'movies#castImages', param: :name
end
