# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Makes show and edit', type: :system do
  let!(:make) { Make.create!(name: 'BMW') }

  # Tests for show functionality
  it 'shows the make details' do
    visit makes_path
    click_link 'Show', href: make_path(make)
    expect(page).to have_content('BMW')
  end

  # Tests for edit functionality
  it 'edits the make' do
    visit makes_path
    click_link 'Edit', href: edit_make_path(make)
    fill_in 'Name', with: 'BMW Updated'
    click_button 'Update Make'
    expect(page).to have_content('Make was successfully updated')
    expect(page).to have_content('BMW Updated')
  end
end
