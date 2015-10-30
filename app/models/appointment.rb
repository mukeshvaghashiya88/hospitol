class Appointment < ActiveRecord::Base
  attr_accessible :doctorId, :userId, :petId, :reminder, :reason, :appointmentDate
  belongs_to :pet
  validates :doctorId, presence: true;
  validates :userId, presence: true
  validates :petId,presence: true
  validates :reason,presence: true

  validate :not_past_date

  def not_past_date
    if self.appointmentDate < Date.today
      errors.add(:date, 'not in past')
    end
  end

end
