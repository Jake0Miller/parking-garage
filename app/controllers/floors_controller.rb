class FloorsController < ApplicationController
  def show
    if params.keys.include?("floor")
      @floor = Floor.includes(:rows).find(params[:floor][:id])
    else
      @floor = Floor.includes(:rows).find(params[:id])
    end
  end
end
