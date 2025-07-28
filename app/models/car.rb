class Car < ApplicationRecord
  belongs_to :vendor

  has_one_attached :image

  validates :name, presence: true
  validates :price, presence: true
end
