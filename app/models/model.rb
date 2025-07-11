class Model < ApplicationRecord
  belongs_to :make
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
end
