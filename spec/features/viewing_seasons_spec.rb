require 'spec_helper'

feature 'Viewing seasons' do
  scenario 'Listing all seasons' do
    season = FactoryGirl.create(:season, description: 'Now')
    visit '/seasons'
    click_link season.description
    expect(page.current_url).to eql(season_url(season))
  end
end

