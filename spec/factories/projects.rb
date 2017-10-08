FactoryGirl.define do
  factory :project do
    title { FFaker::Name.name }
    complete_at { Time.now.utc + rand(1..5).days }
    user

    trait :with_tasks do
      after(:create) do |project|
        create_list :task, 1, project: project
      end
    end

    trait :invalid do
      title nil
    end
  end
end
