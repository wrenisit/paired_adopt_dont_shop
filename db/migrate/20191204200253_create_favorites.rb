class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.belongs_to :pet, foreign_key: true
    end
  end
end
