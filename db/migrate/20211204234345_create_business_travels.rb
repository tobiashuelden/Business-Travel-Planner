class CreateBusinessTravels < ActiveRecord::Migration[6.0]
  def change
    create_table :business_travels do |t|
      t.date :start_date
      t.date :end_date
      t.integer :user_id
      t.string :description
      t.string :travel_purpose

      t.timestamps
    end
  end
end
