class ApprovalUnit < ActiveRecord::Base
	# Relationships
  belongs_to :page
  has_many :responses, dependent: :destroy

  validates :page_id, :format, :value, presence: true

  # Methods
  def preview
  	if self.value.present?
	  	case self.format
	  	when "Leaderboard"
	  		code = switch_code_new(self.value)
	  	when "Skyscraper"
	  		code = switch_code_new(self.value)
	  	when "Mediabar"
	  		code = switch_code_new(self.value)
	  	when "Landing Page"
	  		code = iframe(self.value)
	  	else
	  		code = "No Preview Available"
	  	end
	  	code.to_s.html_safe
	  end
  end

  
	  def switch_code(value)
	  	"<a href='http://delivery.fendix.net/adserver/click.php?n=aa6bfc75&amp;' target='_blank'>
	  	<img src='http://delivery.fendix.net/adserver/view.php?zoneid=#{value}&amp;n=aa6bfc75&amp;charset=UTF-8' border='0' alt='' /></a>"
	  end

	  def switch_code_new(value)
	  	token = SecureRandom.urlsafe_base64
	  	cachebuster = SecureRandom.urlsafe_base64
	  	"<iframe id='#{token}' name='#{token}' src='http://delivery.fendix.net/adserver/frame.php?zoneid=#{value}&amp;cb=#{cachebuster}' frameborder='0' scrolling='no'><a href='http://delivery.fendix.net/adserver/click.php?n=ae00f857&amp;cb=#{cachebuster}' target='_blank'><img src='http://delivery.fendix.net/adserver/view.php?zoneid=#{value}&amp;cb=#{cachebuster}&amp;n=ae00f857' border='0' alt='' /></a></iframe>"
	  end

	  def iframe(url)
	  	safe_url = url # TODO - Sanitize incoming urls 
	  	"<iframe src='#{safe_url}' height='300' width='100%' frameborder='0'></iframe>"
	  end
end
