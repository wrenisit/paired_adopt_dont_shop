require 'rails_helper'

RSpec.describe "User can approve pet adoption" do
  it "Can approve adoption" do
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

      adopt_application = Adopt.create!(name: "P Sherman", address: "42 Wallaby Way",
                                        city: "Sydney", state: "Florida",
                                        phone: "555-867-5309", zip: "80990",
                                        description: "I have a dog ranch, and I'd love to adopt!")

     adopt_application.pets << pet_1

     visit "/adopts/#{adopt_application.id}"

     within "#applied_for_adoptions"
      click_on("Approve #{pet_1.name} adoption")
      expect(page).to have_current_path("/pets/#{pet_1.id}")
      expect(page).to have_content("Pending Adoption")
 end
end
