class CreateFloors < ActiveRecord::Migration[5.2]
  def change
    create_table :floors do |t|
      t.integer :level, unique: true
      t.integer :width
      t.integer :length
      t.references :structure, foreign_key: true

      t.timestamps
    end
  end
end
