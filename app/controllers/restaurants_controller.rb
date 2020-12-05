# frozen_string_literal: true

class RestaurantsController < ApplicationController
  before_action :authenticate_user!

  expose :restaurants, -> { Restaurant.all }
  expose :restaurant
  expose :items, from: :restaurant
end
