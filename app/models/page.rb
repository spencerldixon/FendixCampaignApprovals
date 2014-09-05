class Page < ActiveRecord::Base
	# Relationships
	belongs_to :user
	has_many :approval_units
end
