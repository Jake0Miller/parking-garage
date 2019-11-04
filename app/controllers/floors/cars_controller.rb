class Floors::CarsController < ApplicationController
  def new
    floor = Floor.includes(:spots).find(params[:id])
    c_spot = floor.spots.find {|spot| spot.vehicle_id.nil? && spot.width == 3}
    if c_spot
      c_spot.update_attributes(vehicle: Vehicle.create(width: 3))
      floor.structure.incr_revenue('c')
    else
      b_spot = floor.spots.find {|spot| spot.vehicle_id.nil? && spot.width == 4}
      if b_spot
        b_spot.update_attributes(vehicle: Vehicle.create(width: 3))
        floor.structure.incr_revenue('c')
      else
        flash[:error] = 'There is no more room for car parking!'
      end
    end
    redirect_to floor_path(floor)
  end
end
