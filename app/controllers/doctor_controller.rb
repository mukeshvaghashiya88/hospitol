class DoctorController < ApplicationController
  def index
   @doctor = Appointment.select('pets.name "petname", pet_types.name "pettype",pets.breed,pets.age,pets.weight,pets.lastvisit').joins('INNER JOIN pets ON pets.Id = "petId" INNER JOIN pet_types ON pets.pettype = pet_types.id').where(:doctorId => current_user.id)
  end
end
