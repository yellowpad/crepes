module CampaignsHelper

	def subscribers_by_day(campaign)
		results=campaign.subscribers.group("strftime('%Y-%m-%d', created_at)").count

		js= <<-JavaScript
			var label=#{results.keys};
			var data = #{results.values};
		JavaScript

		js.html_safe
	end
end
