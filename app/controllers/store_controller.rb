class StoreController < ApplicationController
  include CurrentCard
  before_action :set_card
  def index
    @products = Product.order(:title)
  end
end
