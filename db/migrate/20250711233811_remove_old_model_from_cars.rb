# frozen_string_literal: true

# Migration to remove OldModel from Cars table.
class RemoveOldModelFromCars < ActiveRecord::Migration[8.0]
  def change
    remove_column :cars, :model, :string
  end
end
