class CreateIndividuals < ActiveRecord::Migration[6.0]
  def change
    create_table :individuals do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.datetime :dob
      t.timestamps
    end
  end
end
