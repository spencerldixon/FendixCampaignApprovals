json.array!(@responses) do |response|
  json.extract! response, :id, :contact_id, :approval_unit_id, :visible
  json.url response_url(response, format: :json)
end
