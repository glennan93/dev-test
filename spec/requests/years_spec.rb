require 'rails_helper'

RSpec.describe "Years", type: :request do
  let(:bmw) { Make.create!(name: "BMW") }
  let(:series_3) { Model.create!(name: "3 Series", make: bmw) }

  #  Scenario: Creating a Successful Year
  #   Given I am creating a new Year
  #   Given Make "BMW" exists
  #   Given Model "3 Series" exists for "BMW" Make
  #   When I select "BMW" from the "Make" field
  #   When I select "3 Series" from the "Model" field
  #   When I enter in "2001" in the "Year" field
  #   When I click "Submit"
  #   Then a new Year record should be created with the year "2001" associated with "3 Series" Model and associated with "BMW" Make
  describe "POST /years" do
    context "with valid params" do
      it "creates a new Year and redirects" do
        # Attempt to create a Year with valid attributes
        expect {
          post years_path, params: { year: { year: 2001,  model_id: series_3.id, make_id: bmw.id } }
        }.to change(Year, :count).by(1)
        # Should redirect to the new_year_path and show a success message
        expect(response).to redirect_to(new_year_path)
        follow_redirect!
        expect(response.body).to include("Year was successfully created")
      end
    end


  # Scenario: Creating an Unsuccessful Year
  #   Given I am creating a new Year
  #   Given Make "BMW" exists
  #   Given Model "3 Series" exists for "BMW" Make
  #   When I select "BMW" from the "Make" field
  #   When I click "Submit"
  #   Then I should see an error message stating "Year can’t be blank"
  #   Then I should see an error message stating "Model can’t be blank"
  #   Then a new Model record should not be created
    context "with invalid params" do
      it "does not create a new Year and re-renders the form with errors" do
        # Attempt to create a Year with missing model and year
        expect {
          post years_path, params: { year: { year: nil,  model_id: nil, make_id: bmw.id } }
        }.not_to change(Year, :count)
        # Should show a validation error for missing model
        expect(response.body).to match(/Model can('|&#39;)t be blank/)
      end
    end
  end
end