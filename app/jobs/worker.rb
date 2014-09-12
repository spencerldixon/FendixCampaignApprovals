class Worker
  include SuckerPunch::Job

  def perform(event)
  	ActiveRecord::Base.connection_pool.with_connection do
      user = User.find(user_id)
      user.update_attributes(is_awesome: true)
      Log.new(event).track
    end

    # LogJob.new.async.perform("login") # Run it with this
  end
end