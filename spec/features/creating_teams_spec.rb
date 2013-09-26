require 'spec_helper'

feature "Creating Teams" do
  scenario  "can create a team" do
    visit "/"

    click_link "New Team"

    fill_in "Name", with: "Hawks"
    fill_in "Address1", with: "Wolverley High School"
    click_button "Create Team"

    expect(page).to have_content("Team has been created.")

    team = Team.where(name: "Hawks").first

    expect(page.current_url).to eql(team_url(team))

    title = "Hawks - Teams - Leaguer"
    expect(page).to have_title(title)
  end
end
