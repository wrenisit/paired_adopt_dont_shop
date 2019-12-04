require 'rails_helper'

RSpec.describe "User can see shelter reviews", type: :feature do
  before(:each) do
    @shelter_1 = Shelter.create( name:    "Denver Dog Shelter",
                                address: "123 Main St",
                                city:    "Denver",
                                state:   "CO",
                                zip:     "80206")
    @shelter_review_1 = @shelter_1.reviews.create(
                        title:  "WOW! AWESOME SHELTER!",
                        rating:  5,
                        content: "I adopted my friendly pup from here! 10/10 would go back.",
                        opt_picture: "https://coxrare.files.wordpress.com/2018/07/human-empathy-dogs.png?w=1200&h=627&crop=1")

    @shelter_review_2 = @shelter_1.reviews.create(
                        title:  "Cleanest shelter I've been to!",
                        rating:  5,
                        content: "I adopted my friendly pups from here!")

    visit "/shelters/#{@shelter_1.id}"
  end

  it "can see all reviews" do
   within "#shelter-#{@shelter_review_1.id}" do
    expect(page).to have_content("WOW! AWESOME SHELTER!")
    expect(page).to have_content(5)
    expect(page).to have_content("I adopted my friendly pup from here! 10/10 would go back")
    expect(page).to have_css("img[src*='files.wordpress']")
  end

    within "#shelter-#{@shelter_review_2.id}" do
      expect(page).to have_content("Cleanest shelter I've been to!")
      expect(page).to have_content(5)
      expect(page).to have_content("I adopted my friendly pups from here!")
      expect(page).to have_no_css("img[src*='']")
    end
  end

  it "can click link to create a new review" do
    expect(page).to have_link("Create new review")
    click_on("Create new review")
    expect(page).to have_current_path("/shelters/#{@shelter_1.id}/new_review")
  end
end
