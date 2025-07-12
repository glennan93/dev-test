require 'rails_helper'

RSpec.describe "Models", type: :request do
  let(:bmw) { Make.create!(name: "BMW") }

  describe "POST /models" do
    #  Scenario: Creating a Successful Model
    #   Given I am creating a new Model
    #   Given Make "BMW" exists
    #   When I select "BMW" from the "Make" field
    #   When I enter "3 Series" into the "Name" field
    #   When I click "Submit"
    #   Then a new Model record should be created with a name of "3 Series" associated with "BMW" Make
    context "with valid params" do
      it "creates a new Model and redirects" do
        expect {
          post models_path, params: { model: { name: "3 Series", make_id: bmw.id } }
        }.to change(Model, :count).by(1)
        expect(response).to redirect_to(new_model_path)
        follow_redirect!
        expect(response.body).to include("Model was successfully created")
      end
    end

    # Scenario: Creating an Unsuccessful Model
    #   Given I am creating a new Model
    #   Given Make "BMW" exists
    #   When I select "BMW" from the "Make" field
    #   When I click "Submit"
    #   Then I should see an error message stating "Name can’t be blank"
    #   Then a new Model record should not be created
    context "with invalid params" do
      it "does not create a new Model and re-renders the form with errors" do
        expect {
          post models_path, params: { model: { name: "", make_id: bmw.id } }
        }.not_to change(Model, :count)
        expect(response.body).to match(/Name can('|&#39;)t be blank/)
      end
    end
  end
end