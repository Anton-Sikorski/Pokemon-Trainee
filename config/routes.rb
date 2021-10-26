# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'

  resources :pokemon
  resources :main
  resources :articles do
    resources :comments
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
