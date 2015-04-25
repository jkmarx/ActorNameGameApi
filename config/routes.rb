Rails.application.routes.draw do
  get '/movies', to: 'movies#cast'
end
