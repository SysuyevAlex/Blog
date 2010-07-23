ActionController::Routing::Routes.draw do |map|

  map.devise_for :users

  map.resources :comments

  map.resources :posts

  map.resources :topics
  
  map.root :controller => "topics"
  
end
