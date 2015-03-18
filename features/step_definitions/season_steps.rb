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
