class Car < ApplicationRecord
  belongs_to :vendor

  validates :name, presence: true
  validates :price, presence: true
end
