class ApplicationController < ActionController::API
   rescue_from (ActiveRecord::RecordNotFound) { |exception| handle_exception(exception, 404) }

   protected

    def handle_exception(exception, status)
      render json: { error: exception.message, status: status }
    end
end
