class Product < ApplicationRecord
  validates :description, :image_url, :title, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :image_url, allow_blank: true, format: {
      with: %r{\.(gif\jpg\png)\z}i,
      message: 'must be URL for GIF, JPG or PNG image.'
  }
end
