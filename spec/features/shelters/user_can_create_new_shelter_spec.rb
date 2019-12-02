require 'rails_helper'

RSpec.describe 'create new shelter', type: :feature do

  it "can create a new shelter" do
    visit "/shelters/new"
    fill_in :name, with: "New shelter!"
    fill_in :address, with: "123 Main St"
    fill_in :city, with: "Denver"
    fill_in :state, with: "CO"
    fill_in :zip, with: "80206"
    click_button('Create new shelter')
    expect(page).to have_current_path("/shelters")
    expect(page).to have_content("New shelter!")
  end
end
