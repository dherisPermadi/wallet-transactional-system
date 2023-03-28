class ApplicationController < ActionController::API
  include Response
  include SerializerGenerator

  def current_client
    if session[:client_id]
      @current_client ||= session[:client_type].camelize.constantize.find(session[:client_id])
    end
  end

  def client_type
    session[:client_type]
  end

  def must_be_authorized
    return unauthorized_response if current_client.blank?
  end
end
