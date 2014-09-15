class List < ActiveRecord::Base
	# Relationships
	has_and_belongs_to_many :network_partners
	has_many :contacts, through: :network_partners

	validates :name, presence: true
end
