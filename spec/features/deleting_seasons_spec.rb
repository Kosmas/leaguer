require 'spec_helper'

feature 'Deleting Seasons' do
  scenario 'Deleting a season' do
    FactoryGirl.create(:season, description: 'Now')

    visit '/seasons'
    click_link 'Now'
    click_link 'Delete Season'

    expect(page).to have_content('Season has been deleted.')

    visit '/seasons'

    expect(page).to have_no_content('Now')
  end
end

