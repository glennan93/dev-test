# frozen_string_literal: true

class AddModelReferencesToCars < ActiveRecord::Migration[8.0]
  def change
    add_reference :cars, :model, null: false, foreign_key: true
  end
end
