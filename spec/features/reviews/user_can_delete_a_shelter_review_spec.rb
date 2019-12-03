require 'rails_helper'

RSpec.describe "user can delete a review" do
  it "can destroy a review" do
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
      expect(page).to have_link("Delete Review")
      click_on("Delete Review")
    end
    expect(current_path).to eq("/shelters/#{shelter_1.id}")
    expect(page).to_not have_content("#{shelter_review_1.title}")
    expect(page).to_not have_content("#{shelter_review_1.content}")
  end
end
