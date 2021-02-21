class Product < ApplicationRecord
  validates :description, :image_url, :title, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :image_url, allow_blank: true, format: {
      with: %r{\.(jpg|gif|png)\z}i,
      message: 'must be URL for GIF, JPG or PNG image.'
  }
  has_many :orders, through: :line_items
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  private
  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line Items presence')
      throw :abort
    end
  end
end
