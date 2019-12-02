require 'rails_helper'


RSpec.describe "User can edit a shelter", type: :feature do

  it "can edit a shelter" do
    shelter_1 = Shelter.create( name: "Denver Dog Shelter",
                                address: "123 Main St",
                                city:    "Denver",
                                state:   "CO",
                                zip:     "80206")

    visit "/shelters/#{shelter_1.id}/edit"

    fill_in :name, with: "Denver Cat Shelter"
    fill_in :address, with: "123 Cat St"
    fill_in :city, with: "Colorado Springs"
    fill_in :state, with: "Nevada"
    fill_in :zip, with: "80202"
    click_button("Update #{shelter_1.name}")
    expect(page).to have_current_path("/shelters/#{shelter_1.id}")
  end
end
