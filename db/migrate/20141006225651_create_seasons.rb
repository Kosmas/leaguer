class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.text :description
      t.boolean :current

      t.timestamps
    end
  end
end
