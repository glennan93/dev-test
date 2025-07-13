# frozen_string_literal: true

class RemoveYearFromCars < ActiveRecord::Migration[8.0]
  def change
    remove_column :cars, :year, :integer
  end
end
