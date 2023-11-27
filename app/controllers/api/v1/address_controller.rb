module Api
  module V1
    class AddressController < BaseController
      def search
        @location = Location.find_or_create_by(address: params[:q])

        if @location.errors.any?
          render errors: @location.errors.full_messages, status: :unprocessable_entity
        else
          render json: @location.as_json(include: { postal_code: { include: :temperature } }), status: :ok
        end
      end
    end
  end
end
