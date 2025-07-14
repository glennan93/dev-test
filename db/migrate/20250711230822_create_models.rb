# frozen_string_literal: true

# Migration to create the Models table.
class CreateModels < ActiveRecord::Migration[8.0]
  def change
    create_table :models do |t|
      t.string :name
      t.references :make, null: false, foreign_key: true

      t.timestamps
    end
  end
end
