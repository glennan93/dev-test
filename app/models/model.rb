class Model < ApplicationRecord
  belongs_to :make
  has_many :years
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
end
