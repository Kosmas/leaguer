require 'spec_helper'

feature 'Viewing players' do
  before do
    hawks = FactoryGirl.create(:team, name: 'Hawks')
    FactoryGirl.create(:player, team: hawks, first_name: 'Jason', surname: 'Olson', dob: '1990-10-10')

    bullets = FactoryGirl.create(:team, name: 'Bullets')
    FactoryGirl.create(:player, team: bullets, first_name: 'Pete', surname: 'Philips', dob: '1980-03-23')

    visit '/'
  end

  scenario 'Viewing players for a given team' do
    click_link 'Hawks'

    expect(page).to have_content('Olson')
    expect(page).to_not have_content('Philips')

    click_link 'Olson'
    within('#player h2') do
      expect(page).to have_content('Olson')
    end

    expect(page).to have_content('Olson')
  end
end
