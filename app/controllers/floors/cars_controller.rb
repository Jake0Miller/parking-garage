class Floors::CarsController < ApplicationController
  def new
    floor = Floor.includes(:spots).find(params[:id])
    c_spot = floor.spots.find {|spot| spot.vehicle_id.nil? && spot.width == 3}
    if c_spot
      c_spot.vehicle = Vehicle.create(width: 3)
      c_spot.save
      structure = floor.structure
      structure.c_revenue += structure.c_fare
      structure.save
    else
      b_spot = floor.spots.find {|spot| spot.vehicle_id.nil? && spot.width == 4}
      if b_spot
        b_spot.vehicle = Vehicle.create(width: 3)
        b_spot.save
        structure = floor.structure
        structure.c_revenue += structure.c_fare
        structure.save
      end
    end
    redirect_to floor_path(floor)
  end
end
