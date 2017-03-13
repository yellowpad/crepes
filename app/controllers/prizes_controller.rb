class PrizesController < ApplicationController

	def create 
		@campaign = Campaign.find_by(id: params[:campaign_id])
		@prize = Prize.new(prize_params)
		@prize.campaign_id = @campaign.id	

		if @prize.valid?	
			
			@prize.save
			redirect_to admin_path(@campaign)

		else 
			redirect_to admin_path(@campaign)
		end
	end
	
	def edit 
		@prize = Prize.find(params[:id])
	end

	private 
	
		def prize_params 
			params.require(:prize).permit(:title,:milestone)
		end

end