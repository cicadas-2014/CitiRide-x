FactoryGirl.define do
  factory :user do
    username { Faker::Lorem.word }
    email { Faker::Internet.email }
    password { "password" }
    password_confirmation { "password" }
  end

  factory :ride do
    starting_point { Faker::Address.street_address }
    destination { Faker::Address.street_address }
    user
  end

  factory :station do
    name {Faker::Address.street_address}
    latitude {40.76727216}
    longitude {-73.99392888}
  end
end
