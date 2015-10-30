class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    elsif user.doctor?
      can :read, Appointment
    elsif user.receptionist?
      can :read, Appointment
      can :create, Appointment
      can :update, Appointment
      can :destroy, Appointment
    elsif user.customer?
      can :read, Appointment
    end
  end
end
