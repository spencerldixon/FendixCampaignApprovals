class ApprovalUnit < ActiveRecord::Base
	# Relationships
  belongs_to :page

  # Methods
  def preview
  	if self.value.present?
	  	case self.format
	  	when "Leaderboard"
	  		code = dfp_code(self.value)
	  	when "Skyscraper"
	  		code = dfp_code(self.value)
	  	when "Mediabar"
	  		code = dfp_code(self.value)
	  	when "Landing Page"
	  		code = iframe(self.value)
	  	else
	  		code = "No Preview Available"
	  	end
	  	code.to_s.html_safe
	  end
  end

  
	  def dfp_code(value)
	  	"<script type='text/javascript' src='http://partner.googleadservices.com/gampad/google_service.js'>
			</script>
			<script type='text/javascript'>
			GS_googleAddAdSenseService('ca-pub-9003971709719446');
			GS_googleEnableAllServices();
			</script>
			<script type='text/javascript'>
			GA_googleAddSlot('ca-pub-9003971709719446', '#{value}');
			</script>
			<script type='text/javascript'>
			GA_googleFetchAds();
			</script>

			<script type='text/javascript'>
			GA_googleFillSlot('#{value}');
			</script>"
	  end

	  def iframe(url)
	  	safe_url = url # TODO - Sanitize incoming urls 
	  	"<iframe src='#{safe_url}' height='300' width='100%' frameborder='0'></iframe>"
	  end
end
