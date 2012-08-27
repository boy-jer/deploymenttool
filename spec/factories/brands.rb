# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :brand do
    code "FOOB"
    name "Foo Bar"
    color "FFFFFF"
    mid "1234567"
  end
end
