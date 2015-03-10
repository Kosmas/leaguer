Given(/^there is a team "(.*?)"$/) do |name|
  @team = FactoryGirl.create(:team, name: name)
end

When(/^I go to the teams page$/) do
  visit(teams_path)
end

Then(/^I should see the team's name$/) do
  expect(page).to have_content(@team.name)
end

