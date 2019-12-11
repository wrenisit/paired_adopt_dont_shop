require 'rails_helper'

RSpec.describe "shelter ID page", type: :feature do
  it "can show stats per shelter" do
    @shelter_1 = Shelter.create( name: "Denver Dog Shelter",
                                address: "123 Main St",
                                city:    "Denver",
                                state:   "CO",
                                zip:     "80206")

    visit "/shelters/#{@shelter_1.id}"
    within "#stats" do
      expect(page).to have_content("Shelter Statistics")
      expect(page).to have_content("Pet Count: 0")
      expect(page).to have_content("Average Review Rating: 0")
      expect(page).to have_content("Adoptions On File: 0")
    end

    @dog_1 = @shelter_1.pets.create!( image: "https://www.washingtonpost.com/resizer/kPkFQsQjvSIjfXG-mFXDEpxq6-4=/767x0/smart/arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/HB4AT3D3IMI6TMPTWIZ74WAR54.jpg",
                      name: "Sparky",
                      approximate_age: 7,
                      description: "Sparky loves to play! His favorite game is No Take, Only Throw.",
                      sex: "male",
                      adoptable: true)

    visit "/shelters/#{@shelter_1.id}"
    within "#stats" do
      expect(page).to have_content("Shelter Statistics")
      expect(page).to have_content("Pet Count: 1")
      expect(page).to have_content("Average Review Rating: 0")
      expect(page).to have_content("Adoptions On File: 0")
    end

    @shelter_review_1 = @shelter_1.reviews.create(
                        title:  "WOW! AWESOME SHELTER!",
                        rating:  3,
                        content: "I adopted my friendly pup from here! 10/10 would go back.",
                        opt_picture: "https://coxrare.files.wordpress.com/2018/07/human-empathy-dogs.png?w=1200&h=627&crop=1")

    @shelter_review_2 = @shelter_1.reviews.create(
                        title:  "Cleanest shelter I've been to!",
                        rating:  5,
                        content: "I adopted my friendly pups from here!")

    visit "/shelters/#{@shelter_1.id}"
    within "#stats" do
      expect(page).to have_content("Shelter Statistics")
      expect(page).to have_content("Pet Count: 1")
      expect(page).to have_content("Average Review Rating: 4")
      expect(page).to have_content("Adoptions On File: 0")
    end
    @adopt_1 = Adopt.create(
      name: "P Sherman",
      address: "42 Wallaby Way",
      city: "Sydney",
      state: "Florida",
      zip: "87654",
      phone: "555-867-5309",
      description: "woof")
    PetAdopt.create(pet_id: @dog_1.id, adopt_id: @adopt_1.id)
    within "#stats" do
      expect(page).to have_content("Shelter Statistics")
      expect(page).to have_content("Pet Count: 1")
      expect(page).to have_content("Average Review Rating: 4")
      expect(page).to have_content("Adoptions On File: 1")
    end
  end
end
