# frozen_string_literal: true

class OrdersController < ApplicationController
  expose :order
  expose :orders, from: :current_user
  expose :restaurant, from: :order
  expose :order_items, from: :order

  def update
    order.update(order_params)
    flash[:notice] = "Order has been submit"
    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order).permit(:visit_at, :status, :category)
  end
end
