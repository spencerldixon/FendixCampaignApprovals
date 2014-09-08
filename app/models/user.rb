class User < ActiveRecord::Base
	# Relationships
	has_many :pages

	# Devise
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Validation
	validates :first_name, :last_name, presence: true

	def full_name
		"#{self.first_name} #{self.last_name}"
	end
end
