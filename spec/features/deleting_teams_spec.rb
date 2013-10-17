require 'spec_helper'

feature 'Deleting teams' do
  scenario 'Deleting a team' do
    FactoryGirl.create(:team, name: 'Hawks')

    visit '/'
    click_link 'Hawks'
    click_link 'Delete Team'

    expect(page).to have_content('Team has been deleted.')

    visit '/'

    expect(page).to have_no_content('Hawks')
  end
end
