Rails.application.routes.draw do
  devise_for :users
  get 'hearts/tsubuyaki' => 'hearts#tsubuyaki'
  get 'hearts/taiken' => 'hearts#taiken'
  resources :hearts do
  resources :likes, only: [:create, :destroy]
  end
  resources :stars
  root 'hearts#index'
  get'minds/brank' => 'minds#brank'
  resources :minds
  
end

