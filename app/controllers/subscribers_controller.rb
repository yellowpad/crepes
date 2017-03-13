class SubscribersController < ApplicationController

  
  def index

  end

  def create
    @campaign = Campaign.find(params[:campaign_id])
    @sub=@campaign.subscribers.find_by(email: subscriber_params[:email])
    @subscribers = Subscriber.all 
    @subscriber = Subscriber.new(subscriber_params)
    @subscriber.create_referral
    @referrer = @subscribers.find_by(referral_code: subscriber_params[:referred_by])
    @subscriber.campaign = @campaign

    if @sub
      redirect_to "/campaigns/#{@campaign.id}?confirmation=true&subscriber=#{@sub.id}&checkin=true"
    else
    
    	if @subscriber.valid?
    		@subscriber.save
  		
    		if @referrer 
    			@referrer.score = @referrer.score + 1
    	  	@referrer.save
          byebug
      	end
    		
    		redirect_to "/campaigns/#{@campaign.id}?confirmation=true&subscriber=#{@subscriber.id}"
    	else 
    		redirect_to @campaign
    	end
    end

  end

  def show 
  end

  def new
  	@subscriber = Subscriber.new
  end


  private 
  	def subscriber_params 
  		params.require(:subscriber).permit(:name,:email, :referred_by)
  	end

end
