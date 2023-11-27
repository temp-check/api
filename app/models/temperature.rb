require 'uri'
require 'net/http'
class Temperature < ApplicationRecord
  belongs_to :postal_code
  validates :postal_code_id, presence: true, uniqueness: true
  after_validation :lazily_check_forecast#, if: -> { forecast.nil? || updated_at >= 30.minutes.ago }

  def lazily_check_forecast
    weather_api_key = Rails.application.credentials.api.weather
    url = URI("https://api.weatherapi.com/v1/forecast.json?key=#{weather_api_key}&q=#{postal_code.code}&days=10&aqi=no&alerts=no")
    puts url
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = http.request(request)
    puts response.read_body
  end
end
