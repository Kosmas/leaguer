class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string    :name
      t.string    :game_day
      t.string    :game_time
      t.integer   :division_id
      t.integer   :season_id
      t.integer   :secretary_id
      t.integer   :court_id
      t.float     :lat
      t.float     :lng
      t.boolean   :active

      t.timestamps
    end
  end
end
