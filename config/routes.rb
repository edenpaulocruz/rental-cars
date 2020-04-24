Rails.application.routes.draw do
  root 'home#index'
  resources 'manufacturers'
  resources 'car_categories', only:[:index, :show]
end
