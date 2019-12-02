require 'rails_helper'

RSpec.describe "User can edit an existing pet", type: :feature do

  it "can create a new pet" do
    shelter_1 = Shelter.create!( name: "Denver Dog Shelter",
                                address: "123 Main St",
                                city:    "Denver",
                                state:   "CO",
                                zip:     "80206")

    dog_1 = shelter_1.pets.create!( image: "https://www.washingtonpost.com/resizer/kPkFQsQjvSIjfXG-mFXDEpxq6-4=/767x0/smart/arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/HB4AT3D3IMI6TMPTWIZ74WAR54.jpg",
                      name: "Sparky",
                      approximate_age: 7,
                      description: "Sparky loves to play! His favorite game is No Take, Only Throw.",
                      sex: "male",
                      adoptable: true)

    visit "/pets/#{dog_1.id}"
    click_link "Edit #{dog_1.name}"

    fill_in :image_url, with: "https://www.severnedgevets.co.uk/sites/default/files/styles/medium/public/guides/puppy_0.png?itok=qQYZZd9K"
    fill_in :name, with: "Spuds"
    select('Male', :from => 'Sex')
    fill_in :description, with: "A cute cuddly pup!"
    fill_in :approximate_age, with: "3"
    click_button('Update pet')

    edited_pet = Pet.last
    expect(page).to have_current_path("/pets/#{dog_1.id}")

    expect(page).to have_content("Spuds")
    expect(page).to have_content("Male")
    expect(page).to have_content("A cute cuddly pup!")
    expect(page).to have_content("3")
    expect(page).to have_no_content("Female")
    end
  end
