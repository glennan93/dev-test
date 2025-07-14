# frozen_string_literal: true

# Model representing a Year in the inventory system.
# A Year can have many Cars associated with it, and belongs to a Make and Model.
class Year < ApplicationRecord
  has_many :cars
  belongs_to :make, optional: true
  belongs_to :model, optional: true
  validates :year, presence: true,
                   numericality: { only_integer: true, greater_than_or_equal_to: 1886, allow_blank: true }
  validates :make, presence: true
  validates :model, presence: true
end
