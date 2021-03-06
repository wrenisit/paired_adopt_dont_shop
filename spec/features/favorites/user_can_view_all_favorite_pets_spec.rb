require 'rails_helper'

RSpec.describe "User can see all favorited pets" do
  it "can view favorite pets" do
    shelter_1 = Shelter.create(name:    "Denver Dog Shelter",
                                address: "123 Main St",
                                city:    "Denver",
                                state:   "CO",
                                zip:     "80206")
    pet_1 = Pet.create(
      image: "https://cdn3-www.dogtime.com/assets/uploads/2018/10/puppies-cover.jpg",
      name: "Sparky",
      approximate_age: 7,
      sex: "male",
      shelter: shelter_1,
      description: "woof!")

    pet_2 = Pet.create(
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqzuv71T_e5kELaSqga2HQx10iNxvU6jlb9iwb8PN9HTZKaMhc&s",
      name: "Spot",
      approximate_age: 7,
      sex: "male",
      shelter: shelter_1,
      description: "woof!")

  visit "/pets/#{pet_1.id}"
  click_on "Favorite this pet"
  visit "/pets/#{pet_2.id}"
  click_on "Favorite this pet"

  visit "/favorites"

    within "#favorite-#{pet_1.id}" do
      expect(page).to have_content("Sparky")
      expect(page).to have_css("img[src*='dogtime.com/assets/uploads']")
    end

    within "#favorite-#{pet_2.id}" do
      expect(page).to have_content("Spot")
      expect(page).to have_css("img[src*='encrypted-tbn0.gstatic.com']")
    end
  end
end
