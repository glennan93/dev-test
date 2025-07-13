require 'rails_helper'

RSpec.describe 'Car creation', type: :system, js: true do
    let!(:bmw) { Make.create(name: 'BMW') }
    let!(:series_3) { Model.create(name: '3 Series', make: bmw) }
    let!(:year_2022) { Year.create(year: 2022, model: series_3, make: bmw  ) }
    let!(:dealership) { Dealership.create(name: 'BMD of Tigard') }

    # Scenario: Car record created successfully
    #     Given I am creating a new Car
    #     And Make "BMW" exists
    #     And Model "3 Series" exists for "BMW" Make
    #     And Year "2022" exists for "3 Series" Model and "BMW" Make
    #     When I select "BMW" from Make
    #     And I select "3 Series" from Model
    #     And I selected "2022" from Year
    #     When I click "Submit"
    #     Then a new Car record should be created successfully
    it 'creates a new car with valid data' do
        visit new_car_path
        select 'BMW', from: 'Make'
        select '3 Series', from: 'car_model_id'
        select '2022', from: 'car_year_id'
        select 'BMD of Tigard', from: 'car_dealership_id'
        click_button 'Create Car'
        expect(page).to have_content('Car was successfully created.')
        expect(page).to have_current_path(new_car_path)
        expect(Car.last.model.name).to eq('3 Series')
        expect(Car.last.year.year).to eq(2022)
        expect(Car.last.make.name).to eq('BMW')
        expect(Car.last.dealership.name).to eq('BMD of Tigard')
    end

    # Scenario: Car record created with error
    #     Given I am creating a new Car
    #     And Make "BMW" exists
    #     And Model "3 Series" exists for "BMW" Make
    #     And Year "2022" exists for "3 Series" Model and "BMW" Make
    #     When I select "BMW" from Make
    #     When I click "Submit"
    #     Then I should see an error message stating "Model can’t be blank"
    #     Then I should see an error message stating "Year can’t be blank"
    #     Then a new Car should not be created   
    it 'shows error messages when required fields are missing' do
        visit new_car_path
        select 'BMW', from: 'Make'
        click_button 'Create Car'
        expect(page).to have_content("Model can't be blank")
        expect(page).to have_content("Year can't be blank")
    end 
end
