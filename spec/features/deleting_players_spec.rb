require 'spec_helper'

feature 'Deleting players' do
	let! (:team) { FactoryGirl.create(:team) }
	let! (:player) { FactoryGirl.create(:player, team: team) }

	before do
		visit '/'
		click_link team.name
		click_link player.surname
	end

	scenario 'Deleting a player' do
		click_link 'Delete Player'

		expect(page).to have_content('Player has been deleted.')
		expect(page.current_url).to eq(team_url(team))
	end
end
