# frozen_string_literal: true

# Migration to create the Cars table.
class CreateCars < ActiveRecord::Migration[7.2]
  def change
    create_table :cars do |t|
      t.integer :year
      t.string :make
      t.string :model
      t.string :trim
      t.integer :count
      t.references :dealership, null: false, foreign_key: true

      t.timestamps
    end
  end
end
