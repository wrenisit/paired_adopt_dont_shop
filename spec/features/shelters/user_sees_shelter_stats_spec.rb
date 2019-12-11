require 'rails_helper'

RSpec.describe "shelter ID page", type: :feature do
  it "can show stats per shelter" do
    @shelter_1 = Shelter.create( name: "Denver Dog Shelter",
                                address: "123 Main St",
                                city:    "Denver",
                                state:   "CO",
                                zip:     "80206")
    visit "/shelters/#{@shelter_1.id}"
    within "#stats" do
      expect(page).to have_content("Shelter Statistics")
      expect(page).to have_content("Pet Count")
      expect(page).to have_content("Average Review Rating")
      expect(page).to have_content("Adoptions On File")
    end
  end
end
