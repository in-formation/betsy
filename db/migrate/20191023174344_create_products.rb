class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :qty
      t.float :price
      t.string :description
      t.string :status
      t.timestamps
    end
  end
end
