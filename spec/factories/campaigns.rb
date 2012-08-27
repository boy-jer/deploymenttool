# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :campaign do
    name "Foo"
    data_file "Bar"
    drop_date "2012-08-26"
    round 0
    brand_id 1
    counts_approval 1
  end
end
