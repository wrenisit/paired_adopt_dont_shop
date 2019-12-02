require 'rails_helper'

RSpec.describe "User can create a new pet", type: :feature do

  it "can create a new pet" do
    shelter_1 = Shelter.create( name: "Denver Dog Shelter",
                                address: "123 Main St",
                                city:    "Denver",
                                state:   "CO",
                                zip:     "80206")

    visit "/shelters/#{shelter_1.id}/pets/new"

    fill_in :image, with: "https://www.severnedgevets.co.uk/sites/default/files/styles/medium/public/guides/puppy_0.png?itok=qQYZZd9K"
    fill_in :name, with: "Spuds"
    select('Male', :from => 'Sex')
    fill_in :description, with: "A cute cuddy pup!"
    fill_in :approximate_age, with: "3"

    click_button('Create new pet')
    expect(page).to have_current_path("/shelters/#{shelter_1.id}/pets")

    find("img[src='https://www.severnedgevets.co.uk/sites/default/files/styles/medium/public/guides/puppy_0.png?itok=qQYZZd9K']")
    expect(page).to have_content("Spuds")
    expect(page).to have_content("A cute cuddy pup!")
    expect(page).to have_content("3")
    expect(page).to have_content("Male")
    expect(page).to have_no_content("Female")
  end

end
