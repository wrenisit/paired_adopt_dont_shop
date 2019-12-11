require 'rails_helper'

RSpec.describe "User can delete an existing pet", type: :feature do

  it "can delete a pet" do
    shelter_1 = Shelter.create( name: "Denver Dog Shelter",
                                address: "123 Main St",
                                city:    "Denver",
                                state:   "CO",
                                zip:     "80206")

    dog_1 = shelter_1.pets.create( image: "https://www.washingtonpost.com/resizer/kPkFQsQjvSIjfXG-mFXDEpxq6-4=/767x0/smart/arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/HB4AT3D3IMI6TMPTWIZ74WAR54.jpg",
                      name: "Sporky",
                      approximate_age: 7,
                      description: "Sparky loves to play! His favorite game is No Take, Only Throw.",
                      sex: "male",
                      adoptable: false)

    visit "/pets/#{dog_1.id}"
    expect(page).to_not have_link("Delete #{dog_1.name}")
    end
  end
