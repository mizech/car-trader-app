class Vendor < ApplicationRecord
  has_many :cars, dependent: :destroy

  validates :name, presence: true
end
