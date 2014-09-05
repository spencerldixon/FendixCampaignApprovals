json.array!(@contacts) do |contact|
  json.extract! contact, :id, :first_name, :last_name, :email, :job_title, :network_partner_id
  json.url contact_url(contact, format: :json)
end
