class CreatePetAdopts < ActiveRecord::Migration[5.1]
  def change
    create_table :pet_adopts do |t|
      t.references :pet, foreign_key: true
      t.references :adopt, foreign_key: true
      t.timestamps
    end
  end
end
