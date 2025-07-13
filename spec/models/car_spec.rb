require 'rails_helper'

RSpec.describe Year, type: :model do
  # Introduce required variables and objects
  let(:bmw) { Make.create!(name: "BMW") }
  let(:series_3) { Model.create!(name: "3 Series", make: bmw) }
  let(:year) { Year.create!(year: 2001, model: series_3, make: bmw) }
  let(:bmw_dealership) { Dealership.create!(name: "BMW of Tigard") }

  # Scenario: Car record created successfully
  #   Given I am creating a new Car
  #   And Make "BMW" exists
  #   And Model "3 Series" exists for "BMW" Make
  #   And Year "2022" exists for "3 Series" Model and "BMW" Make
  #   When I select "BMW" from Make
  #   And I select "3 Series" from Model
  #   And I selected "2022" from Year
  #   When I click "Submit"
  #   Then a new Car record should be created successfully
  it "is valid with a year, model and make" do
    expect(Car.new(year: year, model: series_3, make: bmw, dealership_id: bmw_dealership.id)).to be_valid
  end

  # Scenario: Car record created with error
  #   Given I am creating a new Car
  #   And Make "BMW" exists
  #   And Model "3 Series" exists for "BMW" Make
  #   And Year "2022" exists for "3 Series" Model and "BMW" Make
  #   When I select "BMW" from Make
  #   When I click "Submit"
  #   Then I should see an error message stating "Model can’t be blank"
  #   Then I should see an error message stating "Year can’t be blank"
  #   Then a new Car should not be created
  it "is invalid without a model" do
    car = Car.new(year: nil, model: nil, make: bmw, dealership_id: bmw_dealership.id)
    expect(car).not_to be_valid
    expect(car.errors[:model]).to include("can't be blank")
  end
end