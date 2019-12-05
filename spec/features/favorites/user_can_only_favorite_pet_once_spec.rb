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

    visit "/pets/#{pet_1.id}"

    expect(Favorite.count).to eq(0)
    click_on("Favorite this pet")
    expect(Favorite.count).to eq(1)
    expect(page).to have_content("Favorite added!")

    expect(page).to_not have_button("Favorite this pet")
  end
end
