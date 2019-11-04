class Floors::MotorcyclesController < ApplicationController
  def new
    floor = Floor.includes(:spots).find(params[:id])
    m_spot = floor.spots.find {|spot| spot.vehicle_id.nil? && spot.width == 2}
    if m_spot
      m_spot.vehicle = Vehicle.create(width: 2)
      structure = floor.structure
      structure.m_revenue += structure.m_fare
    end
    redirect_to floor_path(floor)
  end
end
