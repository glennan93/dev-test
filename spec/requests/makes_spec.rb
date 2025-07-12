require 'rails_helper'

RSpec.describe "Makes", type: :request do
  describe "POST /makes" do

    # Scenario: Creating a Successful Make
    #   Given I am creating a new Make
    #   When I fill in "BMW" in the Name field
    #   And I click "Submit"
    #   Then a new Make record should be created with a name "BMW"
    context "with valid params" do
      it "creates a new Make and redirects" do
        expect {
          post makes_path, params: { make: { name: "BMW" } }
        }.to change(Make, :count).by(1)
        expect(response).to redirect_to(new_make_path)
        follow_redirect!
        expect(response.body).to include("Make was successfully created")
      end
    end

    # Scenario: Creating an Unsuccessful Make
    #   Given I am creating a new Make
    #   When I click "Submit"
    #   Then I should see an error message stating "Name can’t be blank"
    #   Then a new Make record should not be created
    context "with invalid params" do
      it "does not create a new Make and re-renders the form with errors" do
        expect {
          post makes_path, params: { make: { name: "" } }
        }.not_to change(Make, :count)
        expect(response.body).to match(/Name can('|&#39;)t be blank/)
      end
    end
  end
end