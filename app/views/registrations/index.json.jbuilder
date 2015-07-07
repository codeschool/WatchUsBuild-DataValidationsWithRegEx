json.array!(@registrations) do |registration|
  json.extract! registration, :id, :name, :email, :comment
  json.url registration_url(registration, format: :json)
end
