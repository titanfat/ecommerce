class Order < ApplicationRecord
  enum pay_type: {
      "Check"         => 0,
      "Credit cart"   => 1,
      "Purchase order" => 2
  }
  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: pay_types.keys
  has_many :line_items, dependent: :destroy

  def add_line_items_from_card(card)
    card.line_items.each do |item|
      item.card_id = nil
      line_items << item
    end
  end
end
