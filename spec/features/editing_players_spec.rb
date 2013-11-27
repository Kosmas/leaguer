require 'spec_helper'

feature 'Editing players' do
	let!(:team) { FactoryGirl.create(:team) }
	let!(:player) { FactoryGirl.create(:player, team: team) }

	before do
		visit '/'
		click_link team.name
		click_link player.surname
		click_link 'Edit Player'
	end

	scenario 'Updating a player' do
		fill_in 'First name', with: 'Jan'
		click_button 'Update Player'

		expect(page).to have_content('Player has been updated.')

		within('#player h2') do
			expect(page).to have_content('Jan')
		end

		expect(page).to_not have_content player.first_name
	end

	scenario 'Updating a player with invalid information' do
		fill_in 'First name', with: ''
		click_button 'Update Player'

		expect(page).to have_content('Player has not been updated.')
	end
end
