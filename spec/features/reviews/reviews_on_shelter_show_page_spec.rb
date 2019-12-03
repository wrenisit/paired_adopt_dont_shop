require 'rails_helper'

RSpec.describe "User can see shelter reviews", type: :feature do
it "can see all reviews" do
  shelter_1 = Shelter.create( name:    "Denver Dog Shelter",
                              address: "123 Main St",
                              city:    "Denver",
                              state:   "CO",
                              zip:     "80206")
  shelter_review_1 = shelter_1.reviews.create(
                      title:  "WOW! AWESOME SHELTER!",
                      rating:  5,
                      content: "I adopted my friendly pup from here! 10/10 would go back.")
  shelter_review_2 = shelter_1.reviews.create(
                      title:  "Cleanest shelter I've been to!",
                      rating:  5,
                      content: "I adopted my friendly pups from here!")

  visit "/shelters/#{shelter_1.id}"

    within "#shelter-#{shelter_review_1.id}" do
      expect(page).to have_content("WOW! AWESOME SHELTER!")
      expect(page).to have_content(5)
      expect(page).to have_content("I adopted my friendly pup from here! 10/10 would go back")
    end

    within "#shelter-#{shelter_review_2.id}" do
      expect(page).to have_content("Cleanest shelter I've been to!")
      expect(page).to have_content(5)
      expect(page).to have_content("I adopted my friendly pups from here!")
    end
  end
end
