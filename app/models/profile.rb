class Profile < ActiveRecord::Base
  attr_accessible :roleId, :name, :address,:city,:zip,:experience,:state
  validates :name, length: {maximum: 35}, presence:  true;
  validates :zip, length: {maximum: 5},numericality: { only_integer: true },presence:  true
  validates :experience, numericality: { only_integer: true },presence:  true
end
