class AddMakeToCars < ActiveRecord::Migration[8.0]
  def change
    add_reference :cars, :make, null: false, foreign_key: true
  end
end
