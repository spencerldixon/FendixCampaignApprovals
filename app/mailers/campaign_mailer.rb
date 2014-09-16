class CampaignMailer < ActionMailer::Base
  default from: "claire.allen@fendixmedia.co.uk"

  def send_campaign(contact, page, message)
  	@contact = contact
  	@message = message
  	@page = page
  	mail(to: @contact.email, subject: "#{@page.name} Campaign Approval")
  end

  def notify_admin_of_response(responses)
    @responses = responses
    @contact = responses.first.contact
  	@page = responses.first.approval_unit.page
  	mail(to: @page.user.email, subject: "New Response Set for #{@page.name}")
  end
end
