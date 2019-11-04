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
    end
    redirect_to floor_path(floor)
  end
end
