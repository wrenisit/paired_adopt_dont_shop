require "rails_helper"

RSpec.describe "user can edit a review", type: :feature do
  it "can allow a user to edit a page" do
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
     expect(page).to have_link("Edit Review")
     click_link("Edit Review")
   end
    expect(current_path).to eq("/shelters/#{shelter_1.id}/#{shelter_review_1.id}/edit")
    fill_in :title, with: "No Thanks!"
    #fill_in :rating, with: 1
    fill_in :content, with: "I had to wait 27 seconds for the attendant to say Hi to me! Outrageous!"
    click_button("Submit")

    expect(current_path).to eq("/shelters/#{shelter_1.id}")

    within "#shelter-#{shelter_review_1.id}" do
      expect(page).to have_content("No Thanks!")
      expect(page).to have_content(1)
      expect(page).to have_content("I had to wait 27 seconds for the attendant to say Hi to me! Outrageous!")

      expect(page).to_not have_content("WOW! AWESOME SHELTER!")
      expect(page).to_not have_content(5)
      expect(page).to_not have_content("I adopted my friendly pup from here! 10/10 would go back")
    end
  end
end
