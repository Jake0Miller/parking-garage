class CreateStructures < ActiveRecord::Migration[5.2]
  def change
    create_table :structures do |t|
      t.integer :height
      t.integer :width
      t.integer :length
    end
  end
end
