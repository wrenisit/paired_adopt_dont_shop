class AddAdoptionStatusToPets < ActiveRecord::Migration[5.1]
  def change
    add_column :pets, :adoptable, :boolean, default:true
  end
end
