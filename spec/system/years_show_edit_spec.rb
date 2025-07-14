# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Years show and edit', type: :system do
  let!(:bmw) { Make.create!(name: 'BMW') }
  let!(:x5) { Model.create!(name: 'X5', make: bmw) }
  let!(:year_2020) { Year.create!(year: 2020, make: bmw, model: x5) }
  let!(:series_3) { Model.create!(name: '3 Series', make: bmw) }
  let!(:year_2021) { Year.create!(year: 2021, make: bmw, model: series_3) }

  # Tests for show functionality
  it 'shows the make details' do
    visit years_path
    click_link 'Show', href: year_path(year_2020)
    expect(page).to have_content('BMW')
    expect(page).to have_content('X5')
    expect(page).to have_content('2020')
  end

  # Tests for edit functionality
  it 'edits the year' do
    visit years_path
    click_link 'Edit', href: edit_year_path(year_2020)
    select 'BMW', from: 'Make'
    select '3 Series', from: 'Model'
    select '2021', from: 'year_year_id'
    click_button 'Update Year'
    expect(page).to have_content('Year was successfully updated')
    expect(page).to have_content('BMW')
    expect(page).to have_content('3 Series')
    expect(page).to have_content('2021')
  end
end
