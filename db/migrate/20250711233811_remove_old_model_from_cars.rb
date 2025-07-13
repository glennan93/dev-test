# frozen_string_literal: true

class RemoveOldModelFromCars < ActiveRecord::Migration[8.0]
  def change
    remove_column :cars, :model, :string
  end
end
