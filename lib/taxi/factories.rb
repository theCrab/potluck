require "factory_girl"
require "faker"

FactoryGirl.define do
  factory :taxi do
    factory :vehicle do
      registration { 'N880 PFW' }
      make { 'BMW' }
      type { :MPV }
      date_of_reg { Date.today.to_s }
      taxi_plate { 'JVMNKD1209' }
      number_of_seats { 7 }
      colour { 'Maroon' }

    end

    factory :person, aliases: [:vehicle_owner, :organisation_owner, :vehicle_driver] do
      first_name { Faker::Name.first_name }
      last_name { Faker::Name.last_name }
      email { Faker::Internet.email }
      phone { Faker::PhoneNumber.phone_number }
      mobile { Faker::PhoneNumber.phone_number }
      ni_number { 'SH269093B' }
      dob { Date.today }
      caller_number { 'DR024' }
    end

    factory :license do
      number { 'NPWD1098' }
      provider { 'DVLA' }
      starts_on { Date.today }
      expires_on { Date.today + 30 }
      type { :mot }
    end

    factory :organisation, aliases: [:company] do
      name { Faker::Company.name }
      organisation_owner
      organisation_address
    end

    factory :address, aliases: [:passenger_address, :organisation_address, :vehicle_address] do
      street_address { Faker::Address.street_address }
      locality { Faker::Address.secondary_address }
      city { Faker::Address.city }
      county { Faker::Address.state }
      postcode { Faker::Address.postcode }
      country "United Kingdom"
    end

    factory :phone_number, aliases: [:mobile_phone, :house_phone, :office_phone] do
      phone Faker::PhoneNumber.phone_number
      mobile Faker::PhoneNumber.phone_number
    end

    factory :email do
      Faker::Internet.email
    end
  end
end