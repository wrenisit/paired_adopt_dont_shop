require 'rails_helper'

RSpec.describe "shelter ID page", type: :feature do
  before(:each) do
    @shelter_1 = Shelter.create( name: "Denver Dog Shelter",
                                address: "123 Main St",
                                city:    "Denver",
                                state:   "CO",
                                zip:     "80206")
    visit "/shelters/#{@shelter_1.id}"
  end

  it "can view shelter name" do
    expect(page).to have_content(@shelter_1.name)
    expect(page).to have_content(@shelter_1.address)
    expect(page).to have_content(@shelter_1.city)
    expect(page).to have_content(@shelter_1.state)
    expect(page).to have_content(@shelter_1.zip)
  end

  it "can click on edit shelter_name and go to the shelter edit" do
    click_link("Edit #{@shelter_1.name}")
    expect(page).to have_current_path("/shelters/#{@shelter_1.id}/edit")
  end

  it "can click on delete and delete the shelter" do
    shelter_2 = Shelter.create( name: "Colorado Springs Dog Shelter",
                                address: "123 Main St",
                                city:    "Colorado Springs",
                                state:   "CO",
                                zip:     "80206")
    click_link("Delete #{@shelter_1.name}")
    expect(page).to have_current_path("/shelters")
    expect(page).to have_content(shelter_2.name)
  end
end
