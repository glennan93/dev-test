require 'rails_helper'

RSpec.describe 'Models Create', type: :system do
    let!(:make) { Make.create(name: 'BMW') }
    # Scenario: Creating a Successful Model
    #     Given I am creating a new Model
    #     Given Make "BMW" exists
    #     When I select "BMW" from the "Make" field
    #     When I enter "3 Series" into the "Name" field
    #     When I click "Submit"
    #     Then a new Model record should be created with a name of "3 Series" associated with "BMW" Make    
    it 'creates a new model successfully' do
        visit new_model_path

        select "BMW", from: 'Make'
        fill_in 'Name', with: '3 Series'
        click_button 'Create Model'

        expect(page).to have_content('Model was successfully created.')
        expect(Model.count).to eq(1)
        expect(Model.last.name).to eq('3 Series')
        expect(Model.last.make).to eq(make)
    end


    # Scenario: Creating an Unsuccessful Model
    #     Given I am creating a new Model
    #     Given Make "BMW" exists
    #     When I select "BMW" from the "Make" field
    #     When I click "Submit"
    #     Then I should see an error message stating "Name can’t be blank"
    #     Then a new Model record should not be created
    it 'fails to create a model without a name' do
        visit new_model_path

        select "BMW", from: 'Make'
        click_button 'Create Model'

        expect(page).to have_content("Name can't be blank")
        expect(Model.count).to eq(0)
    end    
end
