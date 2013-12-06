# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :summoner do
    name "MyString"
    level 1
    icon 1
    server "MyString"
    honor_friendly 1
    honor_helpful 1
    honor_teamwork 1
    honor_opponent 1
    lifetime_ip 1
    last_season "MyString"
  end
end
