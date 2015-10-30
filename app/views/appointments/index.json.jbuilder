json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :doctorId, :userId, :petId, :reminder, :reason
  json.url appointment_url(appointment, format: :json)
end
