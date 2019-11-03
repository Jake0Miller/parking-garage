class Admin::StructuresController < Admin::BaseController
  def new
    @structure = Structure.new
  end

  def create
    structure = Structure.new(structure_params)
    if structure.save
      redirect_to structures_path
    else
      redirect_to new_admin_structure_path
    end
  end

  private

  def structure_params
    params.require(:structure).permit(:name, :height, :width, :length, :m_fare, :c_fare, :b_fare)
  end
end
