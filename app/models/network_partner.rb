class NetworkPartner < ActiveRecord::Base
	# Relationships
	has_many :contacts
	has_and_belongs_to_many :lists

	validates :name, :urn, presence: true, uniqueness: true

	# Methods
	def full_name
		"#{self.urn} - #{self.name}"
	end
end
