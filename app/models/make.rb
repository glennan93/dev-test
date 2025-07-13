# frozen_string_literal: true

class Make < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  has_many :cars
  has_many :models
  has_many :years
end
