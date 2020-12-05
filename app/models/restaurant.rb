# frozen_string_literal: true

class Restaurant < ApplicationRecord
  belongs_to :city
  has_many :items
  has_many :orders
end
