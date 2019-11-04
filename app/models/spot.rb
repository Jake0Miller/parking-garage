class Spot < ApplicationRecord
  validates_presence_of :number, :width
  validates_uniqueness_of :number, scope: :row
  belongs_to :row
  belongs_to :vehicle, optional: true

  def empty_icon
    return 'M' if self.width == 2
    return 'C' if self.width == 3
    return 'L' if self.width == 4
  end

  def render
    if self.vehicle.nil?
      self.empty_icon
    elsif self.vehicle.width == 2
      '🏍'
    elsif self.vehicle.width == 3
      '🚗'
    elsif self.vehicle.width == 4
      '🚌'
    end
  end
end
