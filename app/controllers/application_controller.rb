class ApplicationController < ActionController::API
  self.responder = Responders::ApplicationResponder

  respond_to :json
end
