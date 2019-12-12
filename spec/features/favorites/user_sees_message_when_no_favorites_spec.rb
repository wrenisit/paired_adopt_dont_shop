require 'rails_helper'

RSpec.describe "User sees a message when no favorited pets" do
  it "has a message for no favorite pets" do
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

    visit "/favorites"
    expect(page).to have_content("Go Look For Your Fur-ever Friends On Our Site")



    visit "/pets/#{pet_1.id}"
    click_on "Favorite this pet"
    visit "/pets/#{pet_2.id}"
    click_on "Favorite this pet"

    visit "/favorites"
    click_on "Remove All Favorited Pets"

    expect(current_path).to eq('/favorites')

    expect(page).to_not have_content("#{pet_1.name}")
    expect(page).to_not have_content("#{pet_1.image}")
    expect(page).to_not have_content("#{pet_2.name}")
    expect(page).to_not have_content("#{pet_2.image}")

    expect(page).to have_content("Go Look For Your Fur-ever Friends On Our Site")
    expect(page).to_not have_button("Remove All Favorited Pets")
  end
end
