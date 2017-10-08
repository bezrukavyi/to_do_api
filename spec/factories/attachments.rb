FactoryGirl.define do
  factory :attachment do
    task
    name { FFaker::Name.name }
    file { Support::Uploader.picture('pic-1', 'png') }
  end
end
