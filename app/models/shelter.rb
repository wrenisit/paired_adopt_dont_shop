class Shelter < ApplicationRecord
  has_many :pets,  dependent: :destroy
  has_many :reviews,  dependent: :destroy

  validates_presence_of :name, :address, :city, :state, :zip

  def find_adoptions
   x = pets.joins(:adopts)
   x.count
  end

  def any_pending?
    counts = 0
    pets.each do |pet|
      if pet.adoptable == false
        counts += 1
      end
    end
    counts
  end

  # def check_pending(shelters)
  #   hash = Hash.new(0)
  #   shelters.each do |shelter|
  #     hash[shelter.id] = any_pending?
  #   end
  #   hash
  # end
end
