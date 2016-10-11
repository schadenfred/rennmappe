class Ownership < ApplicationRecord

  belongs_to :owner, class_name: "User"
  belongs_to :vehicle

  validates_presence_of :owner
  validates_presence_of :vehicle

  accepts_nested_attributes_for :vehicle
  # accepts_nested_attributes_for :owner
end
