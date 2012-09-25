# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :campaign do
    name "Foo"
    drop_date "2012-08-26 02:30:00"
    round 0
    brand_id 1
    counts_approval 1
    scheduled TRUE
    brand
  end
end
