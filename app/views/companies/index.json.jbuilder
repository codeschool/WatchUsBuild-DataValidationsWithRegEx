json.array!(@companies) do |company|
  json.extract! company, :id, :name, :registration_id
  json.url company_url(company, format: :json)
end
