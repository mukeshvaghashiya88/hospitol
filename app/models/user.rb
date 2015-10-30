class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  before_save 'assigned_role'

  def assigned_role
    self.role = Role.find_by name: "Customer" if self.role.nil?
  end

  def assign_userid
    self.id
  end

  def admin?
    self.role.name == "Admin"
  end

  def doctor?
    self.role.name == "Doctor"
  end
  def receptionist?
    self.role.name == "Receptionist"
  end

  def customer?
    self.role.name == "Customer"
  end
end
