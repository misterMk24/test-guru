Rails.application.routes.draw do
  get 'about', to: 'about#show'
  get 'about/author', to: 'about#author'
end
