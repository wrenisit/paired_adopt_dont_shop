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
    shelter_review_1 = @shelter_1.reviews.create(
                        title: "WOW! AWESOME SHELTER!",
                        rating: 5,
                        content: "I adopted my friendly pup from here! 10/10 would go back.")
  end

  it "can delete a shelter" do

    visit "/shelters"

    within "#shelter-#{@shelter_1.id}" do
      expect(page).to have_link("Delete #{@shelter_1.name}")
      expect(page).to have_content(@shelter_1.name)

      click_on("Delete #{@shelter_1.name}")
      expect(page).to have_current_path("/shelters")
    end

    within "#shelter-#{@shelter_2.id}" do
      expect(page).to have_link("Delete #{@shelter_2.name}")
      expect(page).to have_content(@shelter_2.name)

      click_on("Delete #{@shelter_2.name}")
      expect(page).to have_current_path("/shelters")
    end
  end

  it "can delete a shelter from the shelters's show page" do
    visit "/shelters/#{@shelter_1.id}"
    expect(page).to have_content(@shelter_1.name)
    expect(page).to have_content(@shelter_1.address)
    expect(page).to have_content(@shelter_1.city)
    expect(page).to have_content(@shelter_1.state)
    expect(page).to have_content(@shelter_1.zip)

    # click_link "Delete #{@shelter_1.name}"
    # expect(page).to have_current_path("/shelters")
    # expect(page).to have_content("#{@shelter_2.name}")
    # expect(page).to have_no_content("#{@shelter_1.name}")
   end
end
