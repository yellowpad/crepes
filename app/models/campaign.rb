class Campaign < ApplicationRecord
	has_many :subscribers
	belongs_to :user
	has_many :prizes
	validates :title, presence: true, length: { in: 6..72 }
	validates :duration, presence: true
	# before_create :date_validation
	#validates_date :start_date, :after => lambda{ 0.days.ago }
	#validates_date :end_date, :after => :start_date, message: " Date is wrong"#

 	private 
	 

end
