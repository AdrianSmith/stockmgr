# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :user do |f|
  f.email "john.citizen@gmail.com"
  f.password "secret"
  f.password_confirmation "secret"
end
