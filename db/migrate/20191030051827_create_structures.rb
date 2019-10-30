class CreateStructures < ActiveRecord::Migration[5.2]
  def change
    create_table :structures do |t|
      t.integer :height, default: 1
      t.integer :width
      t.integer :length
      t.float :m_fare, default: 5
      t.float :m_revenue, default: 0
      t.float :c_fare, default: 5
      t.float :c_revenue, default: 0
      t.float :b_fare, default: 5
      t.float :b_revenue, default: 0

      t.timestamps
    end
  end
end
