class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      message_response('Login Successful')
    else
      validate_response('Invalid Email or Password')
    end
  end

  def destroy
    session[:user_id] = nil
    message_response('Logged Out')
  end
end
