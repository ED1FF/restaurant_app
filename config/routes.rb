# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  unauthenticated do
    root to: 'home#index'
  end

  authenticated do
    root 'restaurants#index'
  end

  resources :restaurants, only: %i[index show]
  resources :orders, only: %i[index show edit update]
  resources :order_items, only: %i[create update delete]
end
