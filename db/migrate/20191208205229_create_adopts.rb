class CreateAdopts < ActiveRecord::Migration[5.1]
  def change
    create_table :adopts do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :phone
      t.string :description
    end
  end
end
