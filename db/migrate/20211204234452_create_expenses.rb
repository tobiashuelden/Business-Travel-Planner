class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.integer :trip_id
      t.integer :expense
      t.string :expense_type
      t.string :payment_type
      t.string :invoice
      t.string :description

      t.timestamps
    end
  end
end
