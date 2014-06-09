class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :current_user
  impressionist
  
  def current_user   
    #tracking_code cookie will be set permanent.
    if cookies[:code]
      current_user = User.find_by_tracking_code(cookies[:code])
    else
      cookies[:code] = User.generate_token
      cookies[:ip_address] = request.remote_ip
      current_user = User.create(:tracking_code => cookies[:code], :ip_address => request.remote_ip)
    end
    current_user
  end
  
end
