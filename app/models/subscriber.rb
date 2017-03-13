class Subscriber < ApplicationRecord
 validates :email, presence: true
 validates :name, presence: true
 belongs_to :campaign
 before_create :create_referral
 validate :unique_email, on: :create
 validates :referral_code, uniqueness: true, presence: true

	
	def create_referral 
		
		begin
		
			token = SecureRandom.hex(12)	
		
		end while Subscriber.where(referral_code: token).exists?

		self.referral_code = token

	end
	
	def self.search(search, campaign)
	  if search
	    Subscriber.where(email: search, campaign_id: campaign.id)
	  end
	end

	private

	def unique_email
		if self.campaign.subscribers.where(email: email).count > 0
			errors.add(:email, " not unique")
		end
		# byebug

	end


end
