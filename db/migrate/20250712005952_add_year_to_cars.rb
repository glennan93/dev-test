class AddYearToCars < ActiveRecord::Migration[8.0]
  def change
    add_reference :cars, :year, null: false, foreign_key: true
  end
end
