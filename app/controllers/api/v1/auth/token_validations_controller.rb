module Api
  module V1
    module Auth
      class TokenValidationsController < DeviseTokenAuth::TokenValidationsController
        protected

        def render_validate_token_success
          render json: @resource
        end
      end
    end
  end
end
