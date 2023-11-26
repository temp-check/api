class Location < ApplicationRecord
  validates :address, presence: true, uniqueness: true, if: -> { !geocode_error.nil? || !lat.nil? || !lng.nil? }
  
  geocoded_by :address, latitude: :lat, longitude: :lng
  after_validation :lazy_geocode, if: -> { address.present? && address_changed?}

  GEOCODER_SERVICE_UNAVAILABLE = "Geocoder Error: Please try again later.".freeze
  GEOCODER_SERVICE_INVALID_API_KEY = "Geocoder Error: Invalid API key.".freeze

  def self.search(query)
    where("address ILIKE ?", "%#{query}%")
  end

  private

  def lazy_geocode
    begin
      
      geocode
      # Seemingly some invalid addresses *still* return empty lat/lng; manually raising the InvalidRequest in this case.
      raise Geocoder::InvalidRequest if lat.blank? || lng.blank?
    rescue SocketError
      self.errors.add(:address, GEOCODER_SERVICE_UNAVAILABLE)
    rescue Timeout::Error
      self.errors.add(:address, GEOCODER_SERVICE_UNAVAILABLE)
    rescue Geocoder::OverQueryLimitError
      self.errors.add(:address, GEOCODER_SERVICE_UNAVAILABLE)
    rescue Geocoder::RequestDenied
      self.errors.add(:address, GEOCODER_SERVICE_UNAVAILABLE)
    rescue Geocoder::InvalidRequest
      self.geocode_error = 404
    rescue Geocoder::InvalidApiKey
      self.errors.add(:address, GEOCODER_SERVICE_INVALID_API_KEY)
    rescue Geocoder::ServiceUnavailable
      self.errors.add(:address, GEOCODER_SERVICE_UNAVAILABLE)
    end
  end
end
