class ApplicationController < ActionController::API
  include Response

  def current_client
    if session[:client_id]
      @current_client ||= params['client_type'].camelize.constantize.find(session[:client_id])
    end
  end

  def must_be_authorized
    return unauthorized_response if @current_client.blank?
  end
end
