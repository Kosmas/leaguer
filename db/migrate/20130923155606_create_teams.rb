class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :postcode
      t.integer :division_id
      t.integer :season_id
      t.float :lat
      t.float :lng
      t.boolean :active

      t.timestamps
    end
  end
end
