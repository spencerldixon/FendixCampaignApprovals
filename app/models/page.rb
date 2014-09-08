class Page < ActiveRecord::Base
	# Relationships
	belongs_to :user
	has_many :approval_units, dependent: :destroy
	has_many :responses, through: :approval_units

	def mail_page(list, message)
		self.update_attributes(status: "Sending")

		list.contacts.each do |contact|
			Mailer.mail(contact).delay.deliver! # TODO - Or something...
		end

		self.update_attributes(status: "Sent")
	end
end
