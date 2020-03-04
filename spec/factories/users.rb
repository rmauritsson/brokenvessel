FactoryBot.define do
  sequence(:email) { |n| "test#{n}@example.com" }

  factory :user do
    email
    fullname { Faker::Name.name }
    password { 'password' }
    username { Faker::Internet.username }
    contact { Faker::PhoneNumber.cell_phone }

    trait :admin do
      admin { true }
    end

    trait :listener do
      listener { true }
    end
  end
end
