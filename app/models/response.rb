class Response < ActiveRecord::Base
  belongs_to :contact
  belongs_to :approval_unit
end
