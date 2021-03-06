class Worker
  include SuckerPunch::Job

  def perform(page, list, message)
  	ActiveRecord::Base.connection_pool.with_connection do
      page.send_campaign(list, message)
    end
  end

  def notify_admin_of_response(responses)
  	ActiveRecord::Base.connection_pool.with_connection do
  		CampaignMailer.notify_admin_of_response(responses).deliver!
  	end
  end
end