# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ownership do
    user nil
    summoner nil
    is_owner false
  end
end
