# frozen_string_literal: true

class RestaurantsController < ApplicationController
  before_action :authenticate_user!

  expose :restaurants, -> { Restaurant.all }
  expose :restaurant
  expose :items, from: :restaurant
  expose :order, -> { Order.find_by(user_id: current_user.id, restaurant_id: restaurant.id, status: 'cart') }
end
