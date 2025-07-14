# frozen_string_literal: true

# Migration to remove Make from Cars table.
class RemoveMakeFromCars < ActiveRecord::Migration[8.0]
  def change
    remove_column :cars, :make, :string
  end
end
