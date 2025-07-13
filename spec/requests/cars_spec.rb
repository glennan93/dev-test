require 'rails_helper'

RSpec.describe "Years", type: :request do
  let(:bmw) { Make.create!(name: "BMW") }
  let!(:series_3) { Model.create!(name: "3 Series", make: bmw) }
  let!(:year_2022) { Year.create!(year: 2022, model: series_3, make: bmw) }
  let!(:bmw_dealership) { Dealership.create!(name: "BMW of Tigard") }

  describe "POST /cars" do
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
    context "with valid params" do
      it "creates a new Car and redirects" do
        # Attempt to create a Car with valid attributes
        expect {
          post cars_path, params: { car: { year_id: year_2022.id,  model_id: series_3.id, make_id: bmw.id, dealership_id: bmw_dealership.id } }
        }.to change(Car, :count).by(1)
        # Should redirect to the new_car_path and show a success message
        expect(response).to redirect_to(new_car_path)
        follow_redirect!
        expect(response.body).to include("Car was successfully created")
      end
    end

    #   Scenario: Car record created with error
    #     Given I am creating a new Car
    #     And Make "BMW" exists
    #     And Model "3 Series" exists for "BMW" Make
    #     And Year "2022" exists for "3 Series" Model and "BMW" Make
    #     When I select "BMW" from Make
    #     When I click "Submit"
    #     Then I should see an error message stating "Model can’t be blank"
    #     Then I should see an error message stating "Year can’t be blank"
    #     Then a new Car should not be created
    context "with invalid params" do
      it "does not create a new Car and re-renders the form with errors" do
        # Attempt to create a Car with missing model, year and dealership
        expect {
          post cars_path, params: { car: { year: nil,  model_id: nil, make_id: bmw.id, dealership_id: bmw_dealership.id } }
        }.not_to change(Car, :count)
        # Should show a validation error for missing model
        expect(response.body).to match(/Year can('|&#39;)t be blank/)
        expect(response.body).to match(/Model can('|&#39;)t be blank/)
      end
    end
  end
end