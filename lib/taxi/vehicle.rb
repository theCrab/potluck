module Taxi
  class Vehicle
    include Adamantium, DataMapper::Resource
    # Vehicle[:mot :insurance :address :road_tax :tx_plate :owner :type=>[:wchair, :limo, :minibus, :MPV, :Saloon] :make :make_model driver: {}]

    property :id,               Serial
    property :nickname,         String #,  required: true
    property :registration,     String,  required: true
    property :make,             String,  required: true
    property :modeli,           String #,  required: true
    property :type,             Enum[:wchair, :limo, :minibus, :MPV, :saloon], default: :saloon
    property :year,             Date,    required: true
    property :vin,              String,  required: true
    property :taxi_plate,       String,  required: true
    property :number_of_seats,  Integer, required: true
    property :driver_1,         Integer, required: true
    property :driver_2,         Integer
    property :colour,           String,  required: true
    property :fuel_type,        String
    property :owner_id,         Integer
    property :owner_type,       Enum[:person, :organisation], default: :person

    # Purchase Information
    property :purchase_date,    Date
    property :purchase_price,   Integer
    property :purchase_meter,   Integer
    property :purchase_comment, String

    # Warranty Information
    property :warranty_exp_date,   Date
    property :warranty_exp_meter,  Integer

    property :created_at, DateTime
    property :updated_at, DateTime

    has n, :licenses
    has n, :mileages

    def driver
      Taxi::Person.get(driver_1)
    end

    def drivers
      # pr = Taxi::Person.properties[:id]
      d = Taxi::Person.all(id: [driver_1, driver_2].compact)
      # .select{|id| pr.valid?(id)})
      # return driver unless d.size > 1
      d
    end

    def registered_keeper
      type = owner_type
      raise  Taxi::OwnerTypeError, 'The owner_id or owner_type are not available' unless type

      case type
      when :organisation
        Taxi::Organisation.get(owner_id)
      when :person
        Taxi::Person.get(owner_id)
      end
    end

  end #Vehicle

  class Mileage
    include DataMapper::Resource

    property :id,       Serial
    property :on,       DateTime, required: true
    property :odometer, Integer, required: true
    property :at,       Flag[:start_of_shift, :end_of_shift, :last_service, :fueling]
    property :comment,  Text

    property :created_at, DateTime
    property :updated_at, DateTime

    belongs_to :vehicle
  end #Mileage

  class Fuel
    include DataMapper::Resource

    property :id,       Serial
    property :on,       DateTime, required: true
    property :odometer, Integer, required: true
    property :gallons,  Integer, required: true
    property :price,    Integer, required: true
    property :comment,  Text

    property :created_at, DateTime
    property :updated_at, DateTime

    belongs_to :vehicle
  end #Fuel

  class OwnerTypeError < StandardError
  end #OwnerTypeError

end

