# frozen_string_literal: true

class CreateDealerships < ActiveRecord::Migration[7.2]
  def change
    create_table :dealerships do |t|
      t.string :name
      t.string :oem

      t.timestamps
    end
  end
end
