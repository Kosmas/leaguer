require 'spec_helper'

feature 'Creating Players' do
	before do
		FactoryGirl.create(:team, name: 'Hawks')

		visit '/'
		click_link 'Hawks'
		click_link 'New Player'
	end

	scenario 'Creating a player' do
		fill_in 'First name', with: 'Jim'
		fill_in 'Surname', with: 'Jameson'
		fill_in 'Dob', with: '1980-01-01'
		click_button 'Create Player'

		expect(page).to have_content('Player has been created.')
	end

	scenario 'Creating a player without valid attributes fails' do
		click_button 'Create Player'

		expect(page).to have_content('Player has not been created.')
		expect(page).to have_content("First name can't be blank")
		expect(page).to have_content("Surname can't be blank")
		expect(page).to have_content("Dob can't be blank")
	end

	scenario 'Dob must be longer than 9 characters' do
		fill_in 'First name', with: 'Jim'
		fill_in 'Surname', with: 'Jones'
		fill_in 'Dob', with: '1998-0103'
		click_button 'Create Player'

		expect(page).to have_content('Player has not been created.')
		expect(page).to have_content('Dob is too short')
	end
end
