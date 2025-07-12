class Car < ApplicationRecord
  belongs_to :dealership
  belongs_to :make
  belongs_to :model
  belongs_to :year
  validates :make, presence: true
  validates :model, presence: true
  validates :dealership, presence: true
  validates :year, presence: true
end
