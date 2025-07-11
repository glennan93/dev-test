class Car < ApplicationRecord
  belongs_to :dealership
  belongs_to :make
  belongs_to :model
  validates :make, presence: true
  validates :model, presence: true
  validates :dealership, presence: true
end
