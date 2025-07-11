class Car < ApplicationRecord
  belongs_to :dealership
  belongs_to :make
end
