FactoryGirl.define do
  factory :user do
    name 'username'
    email 'test@test.com'
    password 'password'
    password_confirmation 'password'
  end
end
