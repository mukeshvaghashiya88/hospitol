class PetType < ActiveRecord::Base
  attr_accessible :name
  belongs_to :pet
end
