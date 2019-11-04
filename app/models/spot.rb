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

  def self.remove_vehicle(id)
    spot = Spot.find(id)
    vehicle = spot.vehicle
    if vehicle.width == 4
      spots = Spot.where(vehicle: vehicle)
      spots.update_all(vehicle_id: nil)
    else
      spot.update(vehicle_id: nil)
    end
    vehicle.destroy
  end
end
