class StructuresController < ApplicationController
  def index
    @structures = Structure.all
  end
end
