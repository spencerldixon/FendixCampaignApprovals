class Contact < ActiveRecord::Base
	# Relationships
  belongs_to :network_partner
  has_many :responses

  # Validations
  validates :email, presence: true, 
  									uniqueness: true

 	# Methods
 	def full_name
 		"#{self.first_name} #{self.last_name}"
 	end
end
