require 'spec_helper'

feature 'Editing Teams' do
  before do
    FactoryGirl.create(:team, name: 'Hawks')

    visit '/'
    click_link 'Hawks'
    click_link 'Edit Team'
  end

  scenario 'Updating a team' do
    fill_in 'Name', with: 'Hagley Hawks'
    click_button 'Update Team'

    expect(page).to have_content('Team has been updated.')
  end

  scenario 'Updating a team with empty name' do
    fill_in 'Name', with: ''
    click_button 'Update Team'

    expect(page).to have_content('Team has not been updated.')
  end
end
