class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :location
      t.integer :phone
      t.integer :occupancy
      t.string :tags
      t.timestamps
    end
  end
end
