class TemperaturesController < ApplicationController
  before_action :set_temperature, only: %i[ show update destroy ]

  # GET /temperatures
  def index
    @temperatures = Temperature.all

    render json: @temperatures
  end

  # GET /temperatures/1
  def show
    render json: @temperature
  end

  # POST /temperatures
  def create
    @temperature = Temperature.new(temperature_params)

    if @temperature.save
      render json: @temperature, status: :created, location: @temperature
    else
      render json: @temperature.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /temperatures/1
  def update
    if @temperature.update(temperature_params)
      render json: @temperature
    else
      render json: @temperature.errors, status: :unprocessable_entity
    end
  end

  # DELETE /temperatures/1
  def destroy
    @temperature.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_temperature
      @temperature = Temperature.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def temperature_params
      params.require(:temperature).permit(:postal_code, :forecast)
    end
end
