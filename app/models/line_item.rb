class LineItem < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :card
  belongs_to :product, optional: true

  def total_price
    product.price * quantity
  end
end
