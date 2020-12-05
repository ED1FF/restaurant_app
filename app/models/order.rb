class Order < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  enum status: %i[cart pending complete]
end
