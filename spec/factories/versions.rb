# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :version do
    creative 'Foo'
    audience_id 1
    subject_line ""
    from ""
    creative_approval ""
    campaign_id 1
  end
end
