class ApplicationController < ActionController::Base
  before_action :check_user_authentication

  private

  def check_user_authentication
    return if user_signed_in?
    return if bypass_authentication_for_guest_views?

    redirect_to root_url
  end

  def bypass_authentication_for_guest_views?
    # Ensure registration paths are allowed
    return true if controller_path == 'devise/registrations' && action_name.in?(['new', 'create'])
    return true if controller_path == 'devise/sessions' && action_name == 'new'
    return true if controller_name == 'home' && action_name == 'index'

    false
  end
end
