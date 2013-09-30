require 'spec_helper'

feature "Viewing teams" do
  scenario "Listing all teams" do
    team = FactoryGirl.create(:team, name: "Hawks")
    visit '/'
    click_link 'Hawks'
    expect(page.current_url).to eql(team_url(team))
  end
end
