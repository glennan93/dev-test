# frozen_string_literal: true

class Dealership < ApplicationRecord
  has_many :cars, dependent: :destroy
end
