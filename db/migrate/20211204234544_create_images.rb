class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :caption
      t.string :location
      t.integer :post_id

      t.timestamps
    end
  end
end
