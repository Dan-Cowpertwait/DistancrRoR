class AddOwnerToPlaces < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :owner_id, :integer
  end
end
