module PrizesHelper
	def make_muh_slides(campaign, user)
		# prize_count = campaign.prizes.count
		active=false
		tiers_li = campaign.prizes.order(:milestone).each_with_index.map do |camp, index|
			# if index==0
			# 	begin="<li class=>"
			# else
			# 	begin=""
			# end
		da_class = ""
	
			if user.score >= camp.milestone && campaign.prizes[index+1] && user.score <= campaign.prizes[index + 1].milestone
				da_class = "active"
				active=true
			end

			"<li class='#{da_class}' data-id='#{camp.milestone}'>#{camp.milestone} referrels</li>"
		end
		if active==false
			da_class="active"
		else
			da_class=""
		end
		html = "<li class='#{da_class}' data-id='0'>0 referrels</li>" + tiers_li.join("")
		
		# byebug

		return html.html_safe

	end

end

#get campaign and count # of perks
#find out how many points user has 
#put slider at rounded down point on perks slider