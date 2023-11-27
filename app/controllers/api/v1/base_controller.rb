module Api
  module V1
    class BaseController < ApplicationController
      # protect_from_forgery with: :null_session

      def render(options = {})
        options = format_response(options)
        super(options)
      end

      private

      def format_response(options)
        if options[:json]
          options[:json] = {
            data: options[:json],
            errors: format_errors(options.delete(:errors))
          }
        end

        options
      end

      def format_errors(errors)
        errors&.map do |error|
          { message: error }
        end || []
      end
    end
  end
end
