class CampaignMailer < ActionMailer::Base
  default from: "claire.allen@fendixmedia.co.uk"

  def send_campaign(contact, page, message)
  	@contact = contact
  	@message = message
  	@page = page
  	mail(to: @contact.email, subject: "#{@page.name} Campaign Approval")
  end
end
