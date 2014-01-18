module Taxi
  class License
    include Adamantium, DataMapper::Resource

    property :id, Serial
    property :number, String , required: true
    property :provider, String, required: true
    property :starts_on, Date, required: true
    property :expires_on, Date, required: true
    property :type, Enum[:driving, :insurance, :driver_badge, :vehicle_badge, :mot, :road_tax], default: :driving # add a Taxi private_hire/hackney license type
    property :active, Boolean, default: false

    belongs_to :person, required: false
    belongs_to :vehicle, required: false
    # belongs_to :company
  end
end