# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Makes Create', type: :system do
  # Scenario: Creating a Successful Make
  #     Given I am creating a new Make
  #     When I fill in "BMW" in the Name field
  #     And I click "Submit"
  #     Then a new Make record should be created with a name "BMW"
  it 'creates a new Make successfully' do
    visit new_make_path

    fill_in 'Name', with: 'BMW'
    click_button 'Create Make'

    expect(page).to have_content('Make was successfully created.')
    expect(Make.last.name).to eq('BMW')
    expect(Make.count).to eq(1)
  end

  # Scenario: Creating an Unsuccessful Make
  #     Given I am creating a new Make
  #     When I click "Submit"
  #     Then I should see an error message stating "Name can’t be blank"
  #     Then a new Make record should not be created
  it 'fails to create a new Make with no name' do
    visit new_make_path

    click_button 'Create Make'

    expect(page).to have_content("Name can't be blank")
    expect(Make.count).to eq(0)
  end
end
