Rails.application.routes.draw do
  # get '/quarterbacks', to: 'quarterbacks#new'
  get '/quarterbacks/:name/:week', to: 'quarterbacks#new'
  get '/runningbacks/:name/:week', to: 'running_backs#new'
  get '/widereceivers/:name/:week', to: 'wide_receivers#new'
  get '/flexes/:name/:week', to: 'flexes#new'
  get '/defenses/:name/:week', to: 'defenses#new'
  get '/kickers/:name/:week', to: 'kickers#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
