When(/^I add a new season$/) do
  visit '/seasons'
  click_link 'New Season'
  fill_in 'Description', with: '2015-2016'
  check 'Current'
  click_button 'Create Season'
end

Then(/^I should have a new season$/) do
  expect(Season.count).to eq(1)
end

Given(/^there is a season "(.*?)"$/) do |season_descr|
  @season = FactoryGirl.create(:season, description: season_descr)
end

When(/^I go to the seasons page$/) do
  visit '/seasons'
end

Then(/^I should see the season's description$/) do
  expect(page).to have_content(@season.description)
end
