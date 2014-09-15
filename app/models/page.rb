class Page < ActiveRecord::Base
	# Relationships
	belongs_to :user
	has_many :approval_units, dependent: :destroy
	has_many :responses, through: :approval_units

	validates :name, presence: true

	def send_campaign(list, message)
		self.update_attributes(status: "Sending")
		list.contacts.each do |contact|
			CampaignMailer.send_campaign(contact, self, message).deliver! # TODO - Queue this
		end

		self.update_attributes(status: "Sent to #{list.name}")
		#CampaignMailer.send_campaign(admin).deliver! # or some fuckin bullshit
	end
end
