require 'spec_helper'

feature 'Editing Seasons' do
  before do
    FactoryGirl.create(:season, description: 'Now')

    visit '/seasons'
    click_link 'Now'
    click_link 'Edit Season'
  end

  scenario 'Updating a season' do
    fill_in 'Description', with: 'Past'
    click_button 'Update Season'

    expect(page).to have_content('Season has been updated.')
  end
end

