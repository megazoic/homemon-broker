class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception use :exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_action :authenticate
  
  protected
    def authenticate
      authenticate_token || render_unauthorized
    end

    def authenticate_token
      #must check token and return true if the same
      apitoken = "a47a8ef4b11c4de5a4a351734c80a13a"
      apitoken == params[:authenticity_token]
    end

    def render_unauthorized
      self.headers['WWW-Authenticate'] = 'Token realm="Application"'
      render json: "Bad credentials", status: 401
    end
end
