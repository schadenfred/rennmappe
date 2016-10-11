FactoryGirl.define do
  factory :user, aliases: [:owner] do
    sequence(:email) { |n| "person#{n}@example.com" }
    confirmed_at Time.now
  end
end
