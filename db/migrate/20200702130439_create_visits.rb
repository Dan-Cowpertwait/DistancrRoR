class CreateVisits < ActiveRecord::Migration[6.0]
  def change
    create_table :visits do |t|
      t.integer :individual_id
      t.integer :owner_id
      t.timestamps
    end
  end
end
