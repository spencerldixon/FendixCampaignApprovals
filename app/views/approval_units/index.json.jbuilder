json.array!(@approval_units) do |approval_unit|
  json.extract! approval_unit, :id, :page_id, :type, :value, :position
  json.url approval_unit_url(approval_unit, format: :json)
end
