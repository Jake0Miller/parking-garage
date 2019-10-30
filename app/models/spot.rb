class Spot < ApplicationRecord
  validates_presence_of :number, :width
  belongs_to :row
  belongs_to :vehicle
end
