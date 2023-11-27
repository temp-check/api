class PostalCodesController < ApplicationController
  before_action :set_postal_code, only: %i[ show update destroy ]

  # GET /postal_codes
  def index
    @postal_codes = PostalCode.all

    render json: @postal_codes
  end

  # GET /postal_codes/1
  def show
    render json: @postal_code
  end

  # POST /postal_codes
  def create
    @postal_code = PostalCode.new(postal_code_params)

    if @postal_code.save
      render json: @postal_code, status: :created, location: @postal_code
    else
      render json: @postal_code.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /postal_codes/1
  def update
    if @postal_code.update(postal_code_params)
      render json: @postal_code
    else
      render json: @postal_code.errors, status: :unprocessable_entity
    end
  end

  # DELETE /postal_codes/1
  def destroy
    @postal_code.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_postal_code
      @postal_code = PostalCode.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def postal_code_params
      params.require(:postal_code).permit(:code)
    end
end
