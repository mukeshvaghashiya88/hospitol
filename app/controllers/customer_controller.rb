class CustomerController < ApplicationController
  def index
   @customer = Appointment.select("*").joins('INNER JOIN pets ON pets.Id = "petId"').where(:userId => current_user.id)
  end
end
