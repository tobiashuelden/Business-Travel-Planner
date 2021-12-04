class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.string :start_a
      t.string :end_b
      t.datetime :start_date
      t.datetime :end_date
      t.string :trip_type
      t.string :description
      t.integer :business_travel_id

      t.timestamps
    end
  end
end
