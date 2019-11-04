class Floors::MotorcyclesController < ApplicationController
  def new
    floor = Floor.includes(:spots).find(params[:id])
    m_spot = floor.spots.find {|spot| spot.vehicle_id.nil? && spot.width == 2}
    if m_spot
      m_spot.update_attributes(vehicle: Vehicle.create(width: 2))
      floor.structure.incr_revenue('m')
    else
      c_spot = floor.spots.find {|spot| spot.vehicle_id.nil? && spot.width == 3}
      if c_spot
        c_spot.update_attributes(vehicle: Vehicle.create(width: 2))
        floor.structure.incr_revenue('m')
      else
        b_spot = floor.spots.find {|spot| spot.vehicle_id.nil? && spot.width == 4}
        if b_spot
          b_spot.update_attributes(vehicle: Vehicle.create(width: 2))
          floor.structure.incr_revenue('m')
        else
          flash[:error] = 'There is no more room for motorcycle parking!'
        end
      end
    end
    redirect_to floor_path(floor)
  end
end
