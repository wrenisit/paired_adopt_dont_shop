class AddZipToAdopts < ActiveRecord::Migration[5.1]
  def change
    add_column :adopts, :zip, :string
  end
end
