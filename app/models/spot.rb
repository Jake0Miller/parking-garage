class Spot < ApplicationRecord
  validates_presence_of :number, :width
  validates_uniqueness_of :number, scope: :row
  belongs_to :row
  belongs_to :vehicle, optional: true
end
