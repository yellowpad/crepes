module SubscribersHelper

	def confirmation(subscriber_id,checkin)
		sub=Subscriber.find(subscriber_id)
		if checkin
			title="Welcome Back!"
		else
			title="Thanks for Signing Up!"
		end
		slider= make_muh_slides(sub.campaign, sub)
		userscore=nil
		sub.campaign.prizes.order(:milestone).each_with_index do |x, index|
			if sub.score >= x.milestone && sub.campaign.prizes[index+1] && sub.score <= sub.campaign.prizes[index + 1].milestone
				userscore=index+1
			end
		end
		if userscore.nil?
			userscore=0
		end

		html_output=<<-HTML
		<div id="myModal" class="modal fade" role="dialog">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <h4 class="modal-title">#{title}</h4>
		      </div>
		      <div class="modal-body">
			    <p style="font-family:'Montserrat';font-weight:900px;font-size:22px;">Your Score:#{sub.score}</p>
		        <p>Your Referral Code:<input style="display:inline;" class="form-control" readonly type="text" value="#{campaign_url}?referred_by=#{sub.referral_code}"/></p>
		      </div>
			  <div id="year-slider" class="no-ui-slider">
			  	<span id="slider-start" style="display:none">#{userscore}</span>
			  	<span id="slider-max" style="display:none">#{sub.campaign.prizes.count}</span>
				  	<div class="slider"></div>
				  		<ul class="slider-labels eleven-columns" id="sliderthing">
						    #{slider}
				  		</ul>
					</div>
			  </div>		     
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		      </div>
		    </div>

		  </div>
		</div>
		HTML

		html_output.html_safe
	end
end
