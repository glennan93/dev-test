# frozen_string_literal: true

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
