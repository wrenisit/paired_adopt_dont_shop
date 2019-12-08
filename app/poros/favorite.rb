class Favorite
  attr_accessor :pets
  def initialize(hash)
    @pets = hash ||= Hash.new
  end

  def count_of_pets
    @pets.length
  end
end
