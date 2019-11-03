class FloorsController < ApplicationController
  def show
    @level = params[:floor][:height]
    @floor = Floor.where(level: @level, structure_id: params[:structure_id]).includes(:rows)
  end
end
