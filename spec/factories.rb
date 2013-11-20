FactoryGirl.define do
  factory :user, aliases: [:assignee, :owner, :creator] do
    sequence(:email) { |n| "user#{n}@maldoror.tk" }
    sequence(:username) { |n| "user#{n}" }
    password "password"
  end

  factory :task do
    association :assignee
    association :project
    association :creator
    status false
    name "Do something"
    details "You better do something immediately or I will get unstable and want to drink again"
  end

  factory :project do
    name "Project factory"
    association :owner
  end

  factory :comment do
    association :task
    association :user
    text "This is my comment"
  end

  factory :settings do
    time_zone "Novosibirsk"
  end
end
