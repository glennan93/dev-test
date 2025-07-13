# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Make, type: :model do
  # User Scenario: Creating Successful Makes
  #   Given I am creating a new Make
  #   When I fill in 'BMW' in the Name field
  #   And I click 'Submit'
  #   Then a new Make record should be created with a name 'BMW'
  it 'is valid with a name' do
    expect(Make.new(name: 'BMW')).to be_valid
  end

  # User Scenario: Creating an Unsuccessful Make
  #   Given I am creating a new Make
  #   When I click 'Submit'
  #   Then I should see an error message stating 'Name can’t be blank'
  #   Then a new Make record should not be created
  it 'is invalid without a name' do
    make = Make.new(name: '')
    expect(make).not_to be_valid
    expect(make.errors[:name]).to include("can't be blank")
  end

  # Additional test for uniqueness validation
  it 'is invalid with a duplicate name' do
    Make.create!(name: 'Toyota')
    duplicate = Make.new(name: 'Toyota')
    expect(duplicate).not_to be_valid
    expect(duplicate.errors[:name]).to include('has already been taken')
  end

  # Additional test for length validation
  it 'is invalid if name is too long' do
    make = Make.new(name: 'A' * 256)
    expect(make).not_to be_valid
  end
end
