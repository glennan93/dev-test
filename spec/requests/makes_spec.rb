require 'rails_helper'

RSpec.describe "Makes", type: :request do
  describe "POST /makes" do
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