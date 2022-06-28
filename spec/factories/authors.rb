FactoryBot.define do
  factory :author do
    trait :regular_author do
      name { 'Flavio' }
      email { 'flavio@sumup.com' }
      association :library, :regular_library
    end
  end
end
