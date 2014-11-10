class RemoveSeasonIdFromTeam < ActiveRecord::Migration
  def change
    remove_column :teams, :season_id, :integer
  end
end
