# frozen_string_literal: true

# Migration to remove Year from Cars table.
class RemoveYearFromCars < ActiveRecord::Migration[8.0]
  def change
    remove_column :cars, :year, :integer
  end
end
