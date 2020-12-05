# frozen_string_literal: true

class City < ApplicationRecord
  validates :name, uniqueness: { scope: :country }
end
