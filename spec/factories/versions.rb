# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :version do
    creative_approval 1
    creative 'Foo'
    audience_id 1
    subject_line ''
    from ''
    campaign_id 1
  end
end
