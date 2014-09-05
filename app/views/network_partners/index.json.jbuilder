json.array!(@network_partners) do |network_partner|
  json.extract! network_partner, :id, :name, :urn
  json.url network_partner_url(network_partner, format: :json)
end
