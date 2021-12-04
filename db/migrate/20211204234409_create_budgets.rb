class CreateBudgets < ActiveRecord::Migration[6.0]
  def change
    create_table :budgets do |t|
      t.integer :budget
      t.string :budget_type
      t.integer :business_travel_id

      t.timestamps
    end
  end
end
