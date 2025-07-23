class Vendor < ApplicationRecord
  has_many :cars, dependent: :destroy
end
