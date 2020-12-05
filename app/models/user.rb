# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :orders

  def full_name
    [first_name, last_name].join(' ')
  end
end
