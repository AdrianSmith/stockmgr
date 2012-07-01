FactoryGirl.define do
  factory :user do
    email "john.citizen@gmail.com"
    password "secret"
    password_confirmation "secret"
  end
end