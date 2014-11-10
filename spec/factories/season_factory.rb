FactoryGirl.define do
  factory :season do
    description 'Season 2014, best ever'
    current true
    after(:create) { |season| season.teams << FactoryGirl.create(:team) }
  end
end
