class WelcomeController < ApplicationController
  def index
    @campaign = Campaign.new
  	if user_signed_in?
  		redirect_to dashboard_path
  	end
  end
end
