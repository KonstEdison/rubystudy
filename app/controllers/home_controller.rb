class HomeController < ApplicationController
  def index
    if user_signed_in?
      render 'index'  # Your normal home page view for logged-in users
    else
      render 'guest'  # The welcome screen for guests
    end
  end
end
