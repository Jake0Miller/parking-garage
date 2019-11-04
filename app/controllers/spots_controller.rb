class SpotsController < ApplicationController
  def show
    Spot.remove_vehicle(params[:id])
    redirect_to floor_path(params[:floor_id])
  end
end
