class PostalCode < ApplicationRecord
  has_many :locations
  has_one :temperature, dependent: :destroy
end
