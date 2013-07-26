module Taxi
  class License
    include DataMapper::Resource

    property :expiry_on, Date, required: true
    property :type, Enum[:driving, :insurance, :driver_badge, :vehicle_badge]
    property :start_on, Date, required: true

    belongs_to :person
    belongs_to :vehicle
    # belongs_to :company
  end
end