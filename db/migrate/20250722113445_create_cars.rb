class CreateCars < ActiveRecord::Migration[8.0]
  def change
    create_table :cars do |t|
      t.string :name
      t.float :price
      t.references :vendor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
