# frozen_string_literal: true

# Model representing a Model in the inventory system.
# A Model belongs to a Make and can have many Years associated with it.
class Model < ApplicationRecord
  belongs_to :make
  has_many :years
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
end
