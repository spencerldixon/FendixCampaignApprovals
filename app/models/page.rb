class Page < ActiveRecord::Base
	# Relationships
	belongs_to :user
	has_many :approval_units, dependent: :destroy
	has_many :responses, through: :approval_units

	validates :name, presence: true

	# Friendly ID
	extend FriendlyId
  friendly_id :name, use: :slugged

	def send_campaign(list, message)
		self.update_attributes(status: "Sending")
		list.contacts.each do |contact|
			CampaignMailer.send_campaign(contact, self, message).deliver!
		end

		self.update_attributes(status: "Sent to #{list.name}")
		CampaignMailer.campaign_sent(self, list).deliver!
	end

	def should_generate_new_friendly_id?
	  name_changed?
	end
end
