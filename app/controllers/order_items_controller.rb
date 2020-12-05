# frozen_string_literal: true

class OrderItemsController < ApplicationController
  expose :order_item
  expose :order, -> { Order.where(user_id: current_user.id, restaurant_id: restaurant.id, status: 'cart').first_or_create }
  expose :item, id: ->{ params.dig(:order_item, :item_id) || params[:id] }
  expose :restaurant, from: :item

  def create
    order.order_items.create(order_item_params)
    flash[:notice] = "Item has been added to cart"
    redirect_to restaurant
  end

  def update
    order_item.update(order_item_params)
    flash[:notice] = "Item quantity has been updated"
    redirect_to edit_order_path(order)
  end

  private

  def order_item_params
    params.require(:order_item).permit(:item_id, :quantity)
  end
end
