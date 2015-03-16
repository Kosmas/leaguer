Given(/^there is a team "(.*?)"$/) do |name|
  @team = FactoryGirl.create(:team, name: name)
end

When(/^I go to the teams page$/) do
  visit(teams_path)
end

Then(/^I should see the team's name$/) do
  expect(page).to have_content(@team.name)
end

Given(/^I am on the home page$/) do
  visit(root_path)
end

When(/^I add a new team$/) do
  Team.delete(:all)
  click_on('New Team')
  fill_in 'Name', with: 'Flyers'
  click_on('Create Team')
end

Then(/^I should have a new team$/) do
  expect(Team.count).to eq(1)
end

When(/^I edit the team name to "(.*?)"$/) do |new_name|
  @new_name = new_name

  visit(root_path)
  click_on @team.name
  click_on 'Edit Team'
  fill_in 'Name', with: @new_name
  click_on 'Update Team'
end

Then(/^I should see "(.*?)"$/) do |new_name|
  @team.reload
  expect(@team.name).to eql(new_name)
end

When(/^I delete the team$/) do
  visit(root_path)
  click_on @team.name
  click_on 'Delete Team'
end

Then(/^the team should be deleted$/) do
  expect(Team.count).to eq(0)
end
