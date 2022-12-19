FactoryBot.define do
  factory :users_item do
    association :user
    association :item
  end
end
