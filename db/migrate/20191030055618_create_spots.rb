class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.integer :number
      t.integer :width
      t.references :row, foreign_key: true
      t.references :vehicle, foreign_key: true

      t.timestamps
    end
  end
end
