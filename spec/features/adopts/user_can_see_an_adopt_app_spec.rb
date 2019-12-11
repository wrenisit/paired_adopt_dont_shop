require 'rails_helper'

RSpec.describe "User can see all adoption appliations" do
  it "Can see all pending adoptions" do
    shelter_1 = Shelter.create(name:    "Denver Dog Shelter",
                                address: "123 Main St",
                                city:    "Denver",
                                state:   "CO",
                                zip:     "80206")
    pet_1 = Pet.create(
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

      expect(page).to have_content(adopt_application.name)
      expect(page).to have_content(adopt_application.address)
      expect(page).to have_content(adopt_application.city)
      expect(page).to have_content(adopt_application.state)
      expect(page).to have_content(adopt_application.zip)
      expect(page).to have_content(adopt_application.description)

    # within "#applied_for_adoptions" do
    #   expect(page).to have_link(pet_1.name)
    # end
  end
end
