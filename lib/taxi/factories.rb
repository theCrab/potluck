require "factory_girl"

FactoryGirl.define do
  factory :taxi do
    factory :vehicle do
      registration 'N880 PFW'

    end
  end
end