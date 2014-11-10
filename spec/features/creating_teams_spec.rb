require 'spec_helper'

feature 'Creating Teams' do
  before do
    FactoryGirl.create(:season)
    visit '/'

    click_link 'New Team'
  end

  scenario  'can create a team' do
    fill_in 'Name', with: 'Hawks'
    fill_in 'Game day', with: 'Sunday'
    select  'Season 2014, best ever', from: 'seasons'
    click_button 'Create Team'

    expect(page).to have_content('Team has been created.')

    team = Team.where(name: 'Hawks').first

    expect(page.current_url).to eql(team_url(team))

    title = 'Hawks - Teams - Leaguer'
    expect(page).to have_title(title)
  end

  scenario 'can not create a team without a name' do
    click_button 'Create Team'

    expect(page).to have_content('Team has not been created.')
    expect(page).to have_content("Name can't be blank")
  end
end
