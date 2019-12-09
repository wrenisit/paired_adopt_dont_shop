require 'rails_helper'

describe Adopt, type: :model do
  describe "adopts validations" do
    it { should validate_presence_of :name}
    it { should validate_presence_of :address}
    it { should validate_presence_of :city}
    it { should validate_presence_of :state}
    it { should validate_presence_of :zip}
    it { should validate_presence_of :phone}
    it { should validate_presence_of :description}
  end
  describe "relationships" do
    it {should have_many :pet_adopts}
    it {should have_many(:pets).through(:pet_adopts)}
  end
end
