require 'rails_helper'

RSpec.describe "Models show and edit", type: :system do
  let!(:bmw) { Make.create!(name: "BMW") }
  let!(:x5) { Model.create!(name: "X5", make: bmw) }

  # Tests for show functionality
  it "shows the make details" do
    visit models_path
    click_link "Show", href: model_path(x5)
    expect(page).to have_content("BMW")
    expect(page).to have_content("X5")
  end

  # Tests for edit functionality
  it "edits the model" do
    visit models_path
    click_link "Edit", href: edit_model_path(x5)
    select "BMW", from: "Make"    
    fill_in "Name", with: "3 Series"
    click_button "Update Model"
    expect(page).to have_content("Model was successfully updated")
    expect(page).to have_content("BMW")
    expect(page).to have_content("3 Series")
  end
end