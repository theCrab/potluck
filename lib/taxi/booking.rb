module Taxi
  class Booking
    include Adamantium, DataMapper::Resource
    # Booking[airport: [:no, :pickup, :dropoff] :flight_no, :address phone_number pick_up_datetime date_of_job pick_up_address drop_off_address notes number]

    property :id, Serial
    property :number, String
    property :airport, Flag[:yes, :pickup, :dropoff]
    property :flight_no, String
    property :notes, Text
  end
end