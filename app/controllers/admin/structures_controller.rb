class Admin::StructuresController < ApplicationController
  def new
    @structure = Structure.new
  end

  def create
    structure = Structure.new(structure_params)
    redirect_to structures_path
  end

  private

  def structure_params
    params.require(:structure).permit(:name, :height, :width, :length, :m_fare, :c_fare, :b_fare)
  end
end
