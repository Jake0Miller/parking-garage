class SpotsController < ApplicationController
  def show
    spot = Spot.find(params[:id])
    vehicle = spot.vehicle
    if vehicle.width == 4
      spots = Spot.where(vehicle: vehicle)
      spots.update_all(vehicle_id: nil)
    else
      spot.update(vehicle_id: nil)
    end
    vehicle.destroy
    redirect_to floor_path(params[:floor_id])
  end
end
