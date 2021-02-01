class AdminController < ApplicationController
  def index
    @orders_total = Order.count
  end
end
