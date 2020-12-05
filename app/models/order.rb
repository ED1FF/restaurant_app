# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  has_many :order_items, dependent: :destroy

  enum status: %i[cart pending complete]
  enum category: %i[visit delivery]
end
