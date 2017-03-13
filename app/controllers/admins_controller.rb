class AdminsController < ApplicationController
  
  def show
  	if !user_signed_in? 
  		redirect_to root_path
  	end
  	@user = current_user
  	#@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])  	
  end

  # def campaign_activity
  #   @campaign = Campaign.find(params[:id])
  #   @campaign.user = current_user
  #   @subscribers = @campaign.subscribers.all
  # end

end
