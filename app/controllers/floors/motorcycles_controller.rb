class Floors::MotorcyclesController < ApplicationController
  def new
    floor = Floor.find(params[:id]).include()
    binding.pry
  end
end
