# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Homepage navigation', type: :system do
  it 'allows navigation to Cars, Dealerships, Makes, Models, and Years' do
    visit root_path
    click_link 'Cars'
    expect(page).to have_current_path(cars_path)

    visit root_path
    click_link 'Dealerships'
    expect(page).to have_current_path(dealerships_path)

    visit root_path
    click_link 'Makes'
    expect(page).to have_current_path(makes_path)

    visit root_path
    click_link 'Models'
    expect(page).to have_current_path(models_path)

    visit root_path
    click_link 'Years'
    expect(page).to have_current_path(years_path)
  end
end
