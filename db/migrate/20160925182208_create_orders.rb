class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.float :total
      t.string :code
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
