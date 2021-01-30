class LineItem < ApplicationRecord
  belongs_to :card
  belongs_to :product

  def total_price
    product.price * quantity
  end
end
