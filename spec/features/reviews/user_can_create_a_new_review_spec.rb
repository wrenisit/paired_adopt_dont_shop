require 'rails_helper'

RSpec.describe 'user create new shelter review', type: :feature do
  it "can create a new review" do
    shelter_1 = Shelter.create( name: "Denver Dog Shelter",
                                address: "123 Main St",
                                city:    "Denver",
                                state:   "CO",
                                zip:     "80206")
    visit "/shelters/#{shelter_1.id}/new_review"

    fill_in :title, with: "WOW! AWESOME SHELTER!"
    select(5, :from => "rating")
    fill_in :content, with: "I adopted my friendly pups from here!"
    click_button('Create new review')
    expect(page).to have_current_path("/shelters/#{shelter_1.id}")
    # expect(flash[:alert]).to eq("Review created successfully!")
  end
end
