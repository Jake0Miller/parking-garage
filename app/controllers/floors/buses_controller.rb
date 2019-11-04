class Floors::BusesController < ApplicationController
  def new
    floor = Floor.includes(:spots).find(params[:id])
    b_spot = floor.find_bus_parking
    if b_spot
      bus = Vehicle.create(width: 4)
      b_spot[1].each {|spot| spot.update_attributes(vehicle: bus)}
      floor.structure.incr_revenue('b')
    else
      flash[:error] = 'There is no more room for bus parking!'
    end
    redirect_to floor_path(floor)
  end
end
