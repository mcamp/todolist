FactoryGirl.define do 
  factory :user do
    sequence :name do |n|
      "Name#{n}"
    end
    password "pass"
    password_confirmation {password}
    email {"#{name}@example.com"}
  end

  factory :task do
    description "Description 1"
    done false
    association :user, :factory => :user
  end
  
end