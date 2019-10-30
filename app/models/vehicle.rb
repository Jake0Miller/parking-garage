class Vehicle < ApplicationRecord
  validates_presence_of :width
  has_many :spots
end
