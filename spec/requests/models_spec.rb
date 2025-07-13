# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Models', type: :request do
  let(:bmw) { Make.create!(name: 'BMW') }
  let!(:audi) { Make.create!(name: 'Audi') }
  let!(:series_3) { Model.create!(name: '3 Series', make: bmw) }
  let!(:s3) { Model.create!(name: 'S3', make: audi) }

  describe 'POST /models' do
    #  Scenario: Creating a Successful Model
    #   Given I am creating a new Model
    #   Given Make "BMW" exists
    #   When I select "BMW" from the "Make" field
    #   When I enter "3 Series" into the "Name" field
    #   When I click "Submit"
    #   Then a new Model record should be created with a name of "3 Series" associated with "BMW" Make
    context 'with valid params' do
      it 'creates a new Model and redirects' do
        expect do
          post models_path, params: { model: { name: '5 Series', make_id: bmw.id } }
        end.to change(Model, :count).by(1)
        expect(response).to redirect_to(new_model_path)
        follow_redirect!
        expect(response.body).to include('Model was successfully created')
      end
    end

    # Scenario: Creating an Unsuccessful Model
    #   Given I am creating a new Model
    #   Given Make "BMW" exists
    #   When I select "BMW" from the "Make" field
    #   When I click "Submit"
    #   Then I should see an error message stating "Name can’t be blank"
    #   Then a new Model record should not be created
    context 'with invalid params' do
      it 'does not create a new Model and re-renders the form with errors' do
        expect do
          post models_path, params: { model: { name: '', make_id: bmw.id } }
        end.not_to change(Model, :count)
        expect(response.body).to match(/Name can('|&#39;)t be blank/)
      end
    end
  end

  describe 'GET /models/for_make' do
    # Scenario: Car records reference only valid combinations - Make/Model
    #   Given I am creating a new Car
    #   Given Make "BMW" exists
    #   Given Make "Audi" exists
    #   Given Model "3 Series" exists for "BMW" Make
    #   Given Model "S3" exists for "Audi" Make
    #   And I selected "BMW" from "Make"
    #   Then I should see "3 Series" Model options
    #   Then I should not see "S3" Model options

    it 'returns only models for the selected make' do
      get for_make_models_path, params: { make_id: bmw.id }
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      model_names = json.map { |model| model['name'] }
      expect(model_names).to include('3 Series')
      expect(model_names).not_to include('S3')
    end
  end
end
