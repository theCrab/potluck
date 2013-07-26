require "factory_girl"
require "faker"

FactoryGirl.define do
  factory :taxi do
    factory :vehicle do |v|
      v.registration { Faker::Name.name }
      v.make { Faker::Lorem.word }
      v.model { Faker::Lorem.word }
      v.owner { vehicle_owner }

    end

    factory :person, aliases: [:vehicle_owner, :organisation_owner, :vehicle_driver] do
      first_name { Faker::Name.first_name }
      last_name { Faker::Name.last_name }
      email { Faker::Internet.email }
      user_name { Faker::Internet.user_name }
    end

    factory :organisation, aliases: [:company] do
      name { Faker::Company.name }
      organisation_owner
      organisation_address
    end

    factory :address, aliases: [:passenger_address, :organisation_address, :vehicle_address] do
      street_address { Faker::Address.street_address }
      city { Faker::Address.city }
      county { Faker::Address.county }
      postcode { Faker::Address.postcode }
      country "United Kingdom"
    end

    factory :phone_number, aliases: [:mobile_phone, :house_phone, :office_phone] do
      Faker::PhoneNumber.phone_number
    end

    factory :email do
      Faker::Internet.email
    end
  end
end