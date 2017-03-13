class Prize < ApplicationRecord
	validates :title, presence: true, length: {in: 2..26}
	validates :milestone, presence: true, numericality: {greater_than: 0, only_integer: true}
	belongs_to :campaign	
	validate :validate_size
	
	
	private
		
		def validate_size
			if self.campaign.prizes.count > 5
				errors.add(:title, " too many of thing")
			end
		end
end
