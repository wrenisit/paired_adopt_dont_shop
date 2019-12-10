require 'rails_helper'

RSpec.describe "adopt index" do
  it "has an index for adopt" do
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

    adopt_1 = Adopt.new(
      name: "P Sherman",
      address: "42 Wallaby Way",
      city: "Sydney",
      state: "Florida",
      zip: "87654",
      phone: "555-867-5309",
      description: "woof")
    adopt_2 = Adopt.new(
      name: "Bob Hope",
      address: "1 Plaza",
      city: "Seoul",
      state: "Maine",
      zip: "80004",
      phone: "555-555-5555",
      description: "Bork!")
    PetAdopt.create(pet_id: pet_1.id, adopt_id: adopt_1.id)
    PetAdopt.create(pet_id: pet_2.id, adopt_id: adopt_2.id)

  visit '/adopts'
  expect(page).to have_link("#{adopt_1.name}")
  expect(page).to have_link("#{adopt_2.name}")
  end
end
