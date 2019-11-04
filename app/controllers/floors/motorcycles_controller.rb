class Floors::MotorcyclesController < ApplicationController
  def new
    floor = Floor.includes(:spots).find(params[:id])
    m_spot = floor.spots.find {|spot| spot.vehicle_id.nil? && spot.width == 2}
    if m_spot
      m_spot.vehicle = Vehicle.create(width: 2)
      m_spot.save
      structure = floor.structure
      structure.m_revenue += structure.m_fare
      structure.save
    else
      c_spot = floor.spots.find {|spot| spot.vehicle_id.nil? && spot.width == 3}
      if c_spot
        c_spot.vehicle = Vehicle.create(width: 2)
        c_spot.save
        structure = floor.structure
        structure.m_revenue += structure.m_fare
        structure.save
      else
        b_spot = floor.spots.find {|spot| spot.vehicle_id.nil? && spot.width == 4}
        if b_spot
          b_spot.vehicle = Vehicle.create(width: 2)
          b_spot.save
          structure = floor.structure
          structure.m_revenue += structure.m_fare
          structure.save
        end
      end
    end
    redirect_to floor_path(floor)
  end
end
