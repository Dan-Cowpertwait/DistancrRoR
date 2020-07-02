class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :location
      t.string :phone
      t.integer :occupancy
      t.timestamps
    end
  end
end
