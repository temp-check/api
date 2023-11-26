class Location < ApplicationRecord
  validates :address, presence: true

  geocoded_by :address, latitude: :lat, longitude: :lng
  after_validation :geocode, if: -> { address.present? && address_changed? }

  def self.search(query)
    where("address ILIKE ?", "%#{query}%")
  end
end
