require 'rails_helper'

RSpec.describe "Years", type: :request do
  let(:bmw) { Make.create!(name: "BMW") }
  let!(:audi) { Make.create!(name: "Audi") }
  let!(:series_3) { Model.create!(name: "3 Series", make: bmw) }
  let!(:s3) { Model.create!(name: "S3", make: audi) }
  let!(:year_2022) { Year.create!(year: 2022, model: series_3, make: bmw) }
  let!(:year_2019) { Year.create!(year: 2019, model: s3, make: audi) }

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
        expect(response.body).to match(/Year can('|&#39;)t be blank/)
      end
    end
  end

    describe "GET /years/for_model" do
    # Scenario: Car records reference only valid combinations - Model/Year
    #   Given I am creating a new Car
    #   Given Make "BMW" exists
    #   Given Make "Audi" exists
    #   Given Model "3 Series" exists for "BMW" Make
    #   Given Model "S3" exists for "Audi" Make
    #   Given Year "2022" exists for "3 Series" Model and "BMW" Make
    #   Given Year "2019" exists for "S3" Model and "Audi" Make
    #   When I select "BMW" from Make
    #   And I selected "3 Series" from Model
    #   Then I should see "2022" Year options
    #   And I should not see "2019" Year options
    it "returns only years for the selected model/make combination" do 
      get for_model_years_path, params: { make_id: bmw.id, model_id: series_3.id }
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      years = json.map { |year| year["year"]}
      expect(years).to include(2022)
      expect(years).not_to include(2019)
    end
  end
end