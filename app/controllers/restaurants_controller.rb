# frozen_string_literal: true

class RestaurantsController < ApplicationController
  expose :restaurants, -> { Restaurant.all }
end
