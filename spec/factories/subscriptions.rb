# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subscription do
    send_list_id 1
    contact_id 1
  end
end
