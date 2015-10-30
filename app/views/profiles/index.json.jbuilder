json.array!(@profiles) do |profile|
  json.extract! profile, :id, :name, :address, :city, :state, :zip, :school, :experience, :roleId
  json.url profile_url(profile, format: :json)
end
