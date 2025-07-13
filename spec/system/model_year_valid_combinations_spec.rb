require 'rails_helper'

RSpec.describe 'Make Model Valid Combinations', type: :system, js: true do
    let!(:bmw) { Make.create!(name: 'BMW') }
    let!(:series_3) { Model.create!(name: '3 Series', make: bmw) }
    let!(:audi) { Make.create!(name: 'Audi') }
    let!(:s3) { Model.create!(name: 'S3', make: audi) }
    let!(:year_2022) { Year.create!(year: 2022, model: series_3, make: bmw) }
    let!(:year_2019) { Year.create!(year: 2019, model: s3, make: audi) }

    # Scenario: Car records reference only valid combinations - Model/Year
    #     Given I am creating a new Car
    #     Given Make "BMW" exists
    #     Given Make "Audi" exists
    #     Given Model "3 Series" exists for "BMW" Make
    #     Given Model "S3" exists for "Audi" Make
    #     Given Year "2022" exists for "3 Series" Model and "BMW" Make
    #     Given Year "2019" exists for "S3" Model and "Audi" Make
    #     When I select "BMW" from Make
    #     And I selected "3 Series" from Model
    #     Then I should see "2022" Year options
    #     And I should not see "2019" Year options
    it 'validates make and model combinations' do
        visit new_car_path

        select 'BMW', from: 'Make'
        select '3 Series', from: 'car_model_id'
        expect(page).to have_select('car_year_id', with_options: ['2022'])
        expect(page).not_to have_select('car_year_id', with_options: ['2019'])

        select 'Audi', from: 'Make'
        select 'S3', from: 'car_model_id'
        expect(page).to have_select('car_year_id', with_options: ['2019'])
        expect(page).not_to have_select('car_year_id', with_options: ['2022'])
    end
end