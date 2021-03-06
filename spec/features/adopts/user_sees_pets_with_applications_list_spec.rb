require 'rails_helper'

RSpec.describe "list of pets with pending adoptions" do
  it "has a list of pets with adoptions" do
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
  click_on "Apply to Adopt"
  expect(current_path).to eq("/adopts/new")
  expect(page).to have_link("Sparky")
  page.check "#{pet_1.id}"
  fill_in :name, with: "P. Sherman"
  fill_in :address, with: "42 Wallaby Way"
  fill_in :city, with: "Sydney"
  fill_in :state, with: "Florida"
  fill_in :phone, with: "555-867-5309"
  fill_in :zip, with: "80990"
  fill_in :description, with: "I have a dog ranch, and I'd love to adopt!"
  click_on "Submit"

  expect(current_path).to eq('/favorites')
    within "#pending_adoptions" do
      expect(page).to_not have_link("#{pet_2.name}")
      expect(page).to have_link("#{pet_1.name}")
      click_link "#{pet_1.name}"
    end
  end
end
