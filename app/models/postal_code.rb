class PostalCode < ApplicationRecord
  has_many :locations
  has_one :temperature, dependent: :destroy

  after_validation :create_temperature, on: [:create, :update]

  def create_temperature
    self.temperature = Temperature.find_or_create_by(postal_code: self)
    self.temperature.lazy_refresh
    p "TEMPERATURE: #{self.temperature.inspect}"
  end
end
