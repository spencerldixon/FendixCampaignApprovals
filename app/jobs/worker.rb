class Worker
  include SuckerPunch::Job

  def perform(page, list, message)
  	ActiveRecord::Base.connection_pool.with_connection do
      page.send_campaign(list, message)
    end
  end
end