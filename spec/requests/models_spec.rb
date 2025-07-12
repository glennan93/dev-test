require 'rails_helper'

RSpec.describe "Models", type: :request do
  let(:bmw) { Make.create!(name: "BMW") }
  describe "POST /models" do
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