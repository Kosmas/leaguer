require 'spec_helper'

feature 'Creating Seasons' do
  before do
    visit '/seasons'

    click_link 'New Season'
  end

  scenario 'can create a season' do
    fill_in 'Description', with: 'Now'
    check 'Current'
    click_button 'Create Season'

    expect(page).to have_content('Season has been created.')

    season = Season.where(description: 'Now', current: true).first

    expect(page.current_url).to eql(season_url(season))

    title = 'Now - Seasons - Leaguer'
    expect(page).to have_title(title)
  end

end
