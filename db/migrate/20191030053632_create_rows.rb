class CreateRows < ActiveRecord::Migration[5.2]
  def change
    create_table :rows do |t|
      t.string :letter
      t.integer :length
      t.references :floor, foreign_key: true
    end
  end
end
