# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.float :cost
      t.string :description
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
