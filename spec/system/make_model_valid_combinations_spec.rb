# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Make Model Valid Combinations', type: :system, js: true do
  let!(:bmw) { Make.create!(name: 'BMW') }
  let!(:series_3) { Model.create!(name: '3 Series', make: bmw) }
  let!(:audi) { Make.create!(name: 'Audi') }
  let!(:s3) { Model.create!(name: 'S3', make: audi) }

  # Scenario: Car records reference only valid combinations - Make/Model
  #     Given I am creating a new Car
  #     Given Make "BMW" exists
  #     Given Make "Audi" exists
  #     Given Model "3 Series" exists for "BMW" Make
  #     Given Model "S3" exists for "Audi" Make
  #     And I selected "BMW" from "Make"
  #     Then I should see "3 Series" Model options
  #     Then I should not see "S3" Model options
  it 'validates make and model combinations' do
    visit new_car_path

    select 'BMW', from: 'Make'
    expect(page).to have_select('car_model_id', with_options: ['3 Series'])
    expect(page).not_to have_select('car_model_id', with_options: ['S3'])

    select 'Audi', from: 'Make'
    expect(page).to have_select('car_model_id', with_options: ['S3'])
    expect(page).not_to have_select('car_model_id', with_options: ['3 Series'])
  end
end
