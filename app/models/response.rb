class Response < ActiveRecord::Base
  belongs_to :contact
  belongs_to :approval_unit

  def self.pie_chart_data(responses)
  	array = [['Visible', 'Responses']] << ['Yes', responses.where(visible: true).count] << ['No', responses.where(visible: false).count]
  end
end
