FactoryBot.define do
  factory :book do
    trait :regular_book do
      title { 'First' }
      association :author, :regular_author
    end
  end
end
