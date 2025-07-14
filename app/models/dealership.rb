# frozen_string_literal: true

# Model representing a Dealership in the inventory system.
# Cars are dependent on the Dealership, meaning if a Dealership is deleted,
# all associated Cars will also be deleted.
class Dealership < ApplicationRecord
  has_many :cars, dependent: :destroy
end
