require 'rails_helper'

RSpec.describe "User can delete an existing pet", type: :feature do
  before(:each) do
    @shelter_1 = Shelter.create( name: "Denver Dog Shelter",
                                address: "123 Main St",
                                city:    "Denver",
                                state:   "CO",
                                zip:     "80206")

    @dog_1 = @shelter_1.pets.create(
                      image: "https://www.washingtonpost.com/resizer/kPkFQsQjvSIjfXG-mFXDEpxq6-4=/767x0/smart/arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/HB4AT3D3IMI6TMPTWIZ74WAR54.jpg",
                      name: "Sparky",
                      approximate_age: 7,
                      description: "Sparky loves to play! His favorite game is No Take, Only Throw.",
                      sex: "Male",
                      adoptable: true)

    @shelter_2 = Shelter.create( name: "Colorado Springs Dog Shelter",
                                address: "123 Main St",
                                city:    "Colorado Springs",
                                state:   "CO",
                                zip:     "80206")
    @dog_2 = @shelter_2.pets.create( image: "https://www.washingtonpost.com/resizer/kPkFQsQjvSIjfXG-mFXDEpxq6-4=/767x0/smart/arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/HB4AT3D3IMI6TMPTWIZ74WAR54.jpg",
                      name: "Sparky",
                      approximate_age: 7,
                      description: "Sparky loves to play! His favorite game is No Take, Only Throw.",
                      sex: "male",
                      adoptable: false)
  end

  it "can delete a shelter" do
    visit "/shelters/#{@shelter_1.id}"
      expect(page).to have_link("Delete #{@shelter_1.name}")

      click_on("Delete #{@shelter_1.name}")
      expect(page).to have_current_path("/shelters")

    visit "/shelters/#{@shelter_2.id}"

      expect(page).to_not have_link("Delete #{@shelter_2.name}")

  end
end
