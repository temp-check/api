class Location < ApplicationRecord
  validates :query, presence: true
  validates :postalcode, presence: true, if: -> { error.nil? }
end
