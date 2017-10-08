FactoryGirl.define do
  factory :task do
    title { FFaker::Name.name }
    position 1
    complete_at { Time.now.utc + rand(1..5).days }
    project

    trait :invalid do
      title nil
    end
  end
end
