module Api
  module V1
    class BaseController < ActionController::Base
      # Prevent CSRF attacks by raising a null_session.
      protect_from_forgery with: :null_session

      private

      def render_error(code)
        render json: { message: 'An error has occurred' }, status: code
      end
    end
  end
end