class Product < ApplicationRecord
  validates :title, :description, :image_url, :price, presence: true
  validates :price, numericality: {greater_or_equals_to: 0}
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }
end
