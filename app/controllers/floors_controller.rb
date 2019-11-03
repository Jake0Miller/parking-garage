class FloorsController < ApplicationController
  def show
    @floor = Floor.where(level: params[:floor][:height], structure_id: params[:structure_id])[0]
    # binding.pry
  end
end
