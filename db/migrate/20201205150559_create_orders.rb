class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :restaurant, foreign_key: true
      t.datetime :visit_at
      t.integer :category, default: 0
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
