class LineItem < ApplicationRecord
  belongs_to :card
  belongs_to :product
end
