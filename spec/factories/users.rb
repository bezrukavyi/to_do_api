FactoryGirl.define do
  factory :user do
    email { FFaker::Internet.email }
    password { FFaker::Internet.password(8) }
    password_confirmation { password }

    trait :default_password do
      password { 'Password555' }
      password_confirmation { 'Password555' }
    end
  end
end
