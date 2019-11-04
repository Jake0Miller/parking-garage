class Floors::BusesController < ApplicationController
  def new
    floor = Floor.includes(:spots).find(params[:id])
    b_spot = floor.spots.find_all {|spot| spot.vehicle_id.nil? && spot.width == 4}
    b_spot = b_spot.group_by {|spot| spot.row_id}
    b_spot = b_spot.find {|key,val| val.length == 5}
    if b_spot
      bus = Vehicle.create(width: 4)
      b_spot[1].each do |spot|
        spot.vehicle = bus
        spot.save
      end
      structure = floor.structure
      structure.b_revenue += structure.b_fare
      structure.save
    else
      flash[:error] = 'There is no more room for bus parking!'
    end
    redirect_to floor_path(floor)
  end
end
