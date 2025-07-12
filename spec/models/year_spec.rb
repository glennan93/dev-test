require 'rails_helper'

RSpec.describe Year, type: :model do
  # Introduce required variables and objects
  let(:bmw) { Make.create!(name: "BMW") }
  let(:series_3) { Model.create!(name: "3 Series", make: bmw) }
  # Scenario: Creating a Successful Year
  #   Given I am creating a new Year
  #   Given Make "BMW" exists
  #   Given Model "3 Series" exists for "BMW" Make
  #   When I select "BMW" from the "Make" field
  #   When I select "3 Series" from the "Model" field
  #   When I enter in "2001" in the "Year" field
  #   When I click "Submit"
  #   Then a new Year record should be created with the year "2001" associated with "3 Series" Model and associated with "BMW" Make
  it "is valid with a year, model and make" do
    expect(Year.new(year: 2001, model: series_3, make: bmw)).to be_valid
  end

  # Scenario: Creating an Unsuccessful Year
  #   Given I am creating a new Year
  #   Given Make "BMW" exists
  #   Given Model "3 Series" exists for "BMW" Make
  #   When I select "BMW" from the "Make" field
  #   When I click "Submit"
  #   Then I should see an error message stating "Year can’t be blank"
  #   Then I should see an error message stating "Model can’t be blank"
  #   Then a new Model record should not be created
  it "is invalid without a model" do
    year = Year.new(year: nil, model: nil, make: bmw)
    expect(year).not_to be_valid
    expect(year.errors[:model]).to include("can't be blank")
  end

  # Additional test for length validation
  it "is invalid if year is not an integer" do
    year = Year.new(year: "A" * 256, model: series_3, make: bmw)
    expect(year).not_to be_valid
    year.valid?
    expect(year.errors[:year]).to include("is not a number")
  end
end
