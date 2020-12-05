class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  before_save :calculate_subtotal

  private

  def calculate_subtotal
    self.subtotal = quantity * item.cost
  end
end
