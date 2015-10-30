class Pet < ActiveRecord::Base
  attr_accessible :name, :pettype, :breed, :age, :weight, :lastvisit,:id
  has_one :pet_type
  has_many :appointment
  validates :name, length: {maximum: 35}
  validates :breed,length: {maximum: 35}
  validates :age , presence:  true
  validates :weight, presence:  true
  validates :lastvisit, presence: true
end
