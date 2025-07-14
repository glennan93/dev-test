# frozen_string_literal: true

# Model representing a Car in the inventory system.
# A Car belongs to a Dealership, Make, Model, and Year.
class Car < ApplicationRecord
  belongs_to :dealership, optional: true
  belongs_to :make, optional: true
  belongs_to :model, optional: true
  belongs_to :year, optional: true
  validates :make, presence: true
  validates :model, presence: true
  validates :dealership, presence: true
  validates :year, presence: true
end
