# frozen_string_literal: true

class OrderItemsController < ApplicationController
  expose :order_item
  expose :order, -> { Order.where(user_id: current_user.id, restaurant_id: restaurant.id, status: 'cart').first_or_create }
  expose :item, id: ->{ params.dig(:order_item, :item_id) || params[:id] }
  expose :restaurant, from: :item

  def create
    order.order_items.create(order_item_params)
    redirect_to restaurant
  end

  private

  def order_item_params
    params.require(:order_item).permit(:item_id, :quantity)
  end
end
