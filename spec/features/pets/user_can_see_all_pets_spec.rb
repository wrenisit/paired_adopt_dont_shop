require 'rails_helper'

RSpec.describe "pet index page", type: :feature do
  before(:each) do
    @shelter_1 = Shelter.create(name:    "Denver Dog Shelter",
                                address: "123 Main St",
                                city:    "Denver",
                                state:   "CO",
                                zip:     "80206")
    @pet = Pet.create(name: "Sparky",
      approximate_age: 7,
      sex: "male",
      shelter: @shelter_1)
    visit "/pets"
  end

  it "can see all pets" do
    expect(page).to have_content(@pet.name)
  end

  it "can edit pet" do
    click_on("Edit #{@pet.name}")
    expect(page).to have_current_path("/pets/#{@pet.id}/edit")
  end

  it "can delete pet" do
    click_on("Delete #{@pet.name}")
    expect(page).to have_current_path("/pets")
  end

  it "can click on current shelter link" do
    click_on("#{@shelter_1.name}")
    expect(page).to have_current_path("/shelters/#{@shelter_1.id}")
  end
end
