# frozen_string_literal: true

# Model representing a Make in the inventory system.
# A Make can have many Cars, Models, and Years associated with it.
class Make < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  has_many :cars
  has_many :models
  has_many :years
end
