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
end
