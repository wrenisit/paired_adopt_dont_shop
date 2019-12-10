class PetAdopt < ApplicationRecord
  belongs_to :pet
  belongs_to :adopt
end
