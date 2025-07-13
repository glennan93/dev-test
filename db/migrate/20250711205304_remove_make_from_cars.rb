# frozen_string_literal: true

class RemoveMakeFromCars < ActiveRecord::Migration[8.0]
  def change
    remove_column :cars, :make, :string
  end
end
