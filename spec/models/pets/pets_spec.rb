require 'rails_helper'

describe Pet, type: :model do
  describe "pet validations" do
    it { should validate_presence_of :image}
    it { should validate_presence_of :name}
    it { should validate_presence_of :approximate_age}
    it { should validate_presence_of :sex}
    it { should validate_presence_of :shelter}
    it { should validate_presence_of :description}
  end
  describe "relationships" do
    it {should have_many :pet_adopts}
    it {should have_many(:adopts).through(:pet_adopts)}
  end
end
