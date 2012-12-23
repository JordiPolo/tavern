FactoryGirl.define do 

  factory :user do 
    sequence(:first_name) { |n| "john#{n}" }
    sequence(:last_name) { |n| "Smith#{n}" }
  end

  factory :post do
    sequence(:title) { |n| "title#{n}"}
    sequence(:content) { |n| "contents#{n}" }
    association :author,  factory: :user
  end
end
