require 'rails_helper'

RSpec.describe Model, type: :model do
  # Scenario: Creating a Successful Model
  #   Given I am creating a new Model
  #   Given Make "BMW" exists
  #   When I select "BMW" from the "Make" field
  #   When I enter "3 Series" into the "Name" field
  #   When I click "Submit"
  #   Then a new Model record should be created with a name of "3 Series"      #   associated with "BMW" Make

  let(:bmw) { Make.create!(name: "BMW") }

  it "is valid with a name" do
    expect(Model.new(name: "3 Series", make: bmw)).to be_valid
  end

  # Scenario: Creating an Unsuccessful Model
  #   Given I am creating a new Model
  #   Given Make "BMW" exists
  #   When I select "BMW" from the "Make" field
  #   When I click "Submit"
  #   Then I should see an error message stating "Name can’t be blank"
  #   Then a new Model record should not be created
  it "is invalid without a name" do
    model = Model.new(name: "", make: bmw)
    expect(model).not_to be_valid
    expect(model.errors[:name]).to include("can't be blank")
  end

  # Additional test for uniqueness validation
  it "is invalid with a duplicate name" do
    Model.create!(name: "5 Series", make: bmw)
    duplicate = Model.new(name: "5 Series", make: bmw)
    expect(duplicate).not_to be_valid
    duplicate.valid?
    expect(duplicate.errors[:name]).to include("has already been taken")
  end

  # Additional test for length validation
  it "is invalid if name is too long" do
    model = Model.new(name: "A" * 256)
    expect(model).not_to be_valid
  end
end
