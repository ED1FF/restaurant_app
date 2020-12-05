# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :city, index: true
      t.string :street
      t.bigint  :addressable_id
      t.string  :addressable_type
      t.string :notes
      t.string :phone_number

      t.timestamps
    end
    add_index :addresses, %i[addressable_type addressable_id]
  end
end
