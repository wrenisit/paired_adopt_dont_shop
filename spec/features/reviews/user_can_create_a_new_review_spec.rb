require 'rails_helper'

RSpec.describe 'user create new shelter review', type: :feature do
  before(:each) do
    @shelter_1 = Shelter.create( name: "Denver Dog Shelter",
                                address: "123 Main St",
                                city:    "Denver",
                                state:   "CO",
                                zip:     "80206")
    visit "/shelters/#{@shelter_1.id}/new_review"
  end

  it "can create a new review" do
    fill_in :title, with: "WOW! AWESOME SHELTER!"
    select(5, :from => "rating")
    fill_in :content, with: "I adopted my friendly pups from here!"
    click_button('Create new review')
    expect(page).to have_current_path("/shelters/#{@shelter_1.id}")
    expect(page).to have_content("Review created successfully!")
  end

  it "cannot create a new review with missing information" do
    fill_in :title, with: "WOW! AWESOME SHELTER!"
    select(5, :from => "rating")
    click_button('Create new review')
    expect(page).to have_current_path("/shelters/#{@shelter_1.id}/new_review")
    expect(page).to have_content("Review was not created. Required information missing")
  end
end
