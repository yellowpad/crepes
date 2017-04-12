class CampaignsController < ApplicationController

	before_action :set_campaign, only: [:edit, :show, :stats]

	def new
		@campaign = Campaign.new
	end

	def index
	end

	def show
		@prize = Prize.new
		@subscribers = Subscriber.all
		@subscriber = Subscriber.new
		@referred_by = params[:referred_by] #if !params[:referred_by].nil?
		search = params[:term]
		@result = Subscriber.search(search, @campaign) if search
	end

	def search

	end

	def create
		@campaign = Campaign.new(campaign_params)
		# if !user_signed_in?
		@campaign.user = current_user if current_user
		if @campaign.valid?
			@campaign.save
			redirect_to admin_path(@campaign)
		else
			render :new
		end
	end

	def activate
		@campaign = Campaign.find(params[:id])
		if @campaign.user.nil? && current_user.nil?
			flash[:errors]="Please create a user account"
			redirect_to admin_path(@campaign)
		end
		if @campaign.active
			@campaign.update(active: 0)
		else
			@campaign.update(active: 1, activate_date: Date.today.to_s )
		end
		if @campaign.valid?
			redirect_to @campaign
		else
			flash[:errors]="something went wrong"
			redirect_to admin_path(@campaign)
		end
	end

	def admin
		@campaign = Campaign.find(params[:id])

		@prize = Prize.new
		@prizes = @campaign.prizes

		if current_user != @campaign.user
			redirect_to new_user_session_path
		end
		@subscribers = @campaign.subscribers.all.order("score DESC")
	end

	def stats
		@campaign = Campaign.find(params[:id])

		if current_user != @campaign.user
			redirect_to new_user_session_path
		end

		@subscribers = @campaign.subscribers.all.order("score DESC")
		respond_to do |format|
			format.html
			format.csv do
				headers['Content-Disposition'] = "attachment; filename=\"subscriber-list\""
				headers['Content-Type'] ||= 'text/csv'
			end
		end
	end

	private

		def campaign_params
			params.require(:campaign).permit(:title,:duration, :term)
		end

		def set_campaign
			@campaign = Campaign.find(params[:id])
		end

		# def all_campaigns
		# 	@campaigns = Campaign.all
		# end
end
