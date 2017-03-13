module SubscribersHelper

	def confirmation(subscriber_id,checkin)
		sub=Subscriber.find(subscriber_id)
		if checkin
			title="Welcome Back!"
		else
			title="Thanks for Signing Up!"
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
