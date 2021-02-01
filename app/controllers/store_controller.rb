class StoreController < ApplicationController
  skip_before_action :authorize
  include CurrentCard
  before_action :set_card
  def index
    @products = Product.order(:title)
  end
end
