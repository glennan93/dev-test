# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Years Create', type: :system do
  let!(:make) { Make.create(name: 'BMW') }
  let!(:model) { Model.create(name: '3 Series', make: make) }
  # Scenario: Creating a Successful Year
  #     Given I am creating a new Year
  #     Given Make "BMW" exists
  #     Given Model "3 Series" exists for "BMW" Make
  #     When I select "BMW" from the "Make" field
  #     When I select "3 Series" from the "Model" field
  #     When I enter in "2001" in the "Year" field
  #     When I click "Submit"
  #     Then a new Year record should be created with the year "2001"
  #     associated with "3 Series" Model and associated with "BMW" Make
  it 'creates a new year successfully' do
    visit new_year_path

    select 'BMW', from: 'Make'
    select '3 Series', from: 'Model'
    fill_in 'Year', with: '2001'
    click_button 'Create Year'

    expect(page).to have_content('Year was successfully created.')
    expect(Year.last.year).to eq(2001)
    expect(Year.last.model.name).to eq('3 Series')
    expect(Year.last.model.make.name).to eq('BMW')
    expect(Year.count).to eq(1)
  end

  # Scenario: Creating an Unsuccessful Year
  #     Given I am creating a new Year
  #     Given Make "BMW" exists
  #     Given Model "3 Series" exists for "BMW" Make
  #     When I select "BMW" from the "Make" field
  #     When I click "Submit"
  #     Then I should see an error message stating "Year can’t be blank"
  #     Then I should see an error message stating "Model can’t be blank"
  #     Then a new Year record should not be created

  it 'fails to create a year without a year and model' do
    visit new_year_path

    select 'BMW', from: 'Make'
    click_button 'Create Year'

    expect(page).to have_content("Year can't be blank")
    expect(page).to have_content("Model can't be blank")
    expect(Year.count).to eq(0)
  end
end
