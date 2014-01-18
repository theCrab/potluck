module Taxi

  class Address
    include DataMapper::Resource #Adamantium,

    property :id,             Serial
    property :street_address, String, required: true
    property :locality,       String
    property :city,           String, required: true
    property :county,         String, required: true
    property :postcode,       String, required: true
    property :country,        String, required: true

    property :created_at,     DateTime
    property :updated_at,     DateTime

    belongs_to :person
    # belongs_to :vehicle
    # belongs_to :organisation
  end
end