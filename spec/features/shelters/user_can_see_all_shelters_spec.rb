require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  before(:each) do
    @shelter_1 = Shelter.create( name: "Denver Dog Shelter",
                                  address: "123 Main St",
                                  city:    "Denver",
                                  state:   "CO",
                                  zip:     "80206")
    @shelter_2 = Shelter.create( name: "Denver Cat Shelter",
                                  address: "123 Meow St",
                                  city:    "Denver",
                                  state:   "CO",
                                  zip:     "80206")
    visit "/shelters"
  end

  it "can see all shelters" do
    within "#shelter-#{@shelter_1.id}"
      expect(page).to have_content(@shelter_1.name)
      expect(page).to have_link("Edit #{@shelter_1.name}")
      expect(page).to have_link("Delete #{@shelter_1.name}")

    within "#shelter-#{@shelter_2.id}"
      expect(page).to have_content(@shelter_2.name)
      expect(page).to have_link("Edit #{@shelter_2.name}")
      expect(page).to have_link("Delete #{@shelter_2.name}")
    end

# ambiguous matches -- needs to be resolved
#    it "can click on a shelter and go to the page" do
#     within "#shelter-#{@shelter_1.id}"
#       click_on("Edit #{@shelter_1.name}")
#       expect(page).to have_current_path("/shelters/#{@shelter_1.id}/edit")
#     end

  # xit "can click on an edit link and go to the page" do
  #   click_on("Edit #{@shelter_1.name}")
  #   expect(page).to have_current_path("/shelters/#{@shelter_1.id}/edit")
  # end
  #
  # xit "can click on a delete button and refresh the page" do
  #   click_on("Delete #{@shelter_1.name}")
  #   expect(page).to have_current_path("/shelters")
  # end
end
