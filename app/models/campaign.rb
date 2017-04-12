class Campaign < ApplicationRecord
	has_many :subscribers
	belongs_to :user, optional: true
	has_many :prizes
	validates :title, presence: true, length: { in: 6..72 }
	validates :duration, presence: true
	validate :activation

	# before_create :date_validation
	#validates_date :start_date, :after => lambda{ 0.days.ago }
	#validates_date :end_date, :after => :start_date, message: " Date is wrong"#

 	private
	#
	def activation
		if active && user_id.nil?
			errors.add(:active, " Must have a user account to activate")
		end
	end

end
