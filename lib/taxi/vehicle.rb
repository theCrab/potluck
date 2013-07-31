module Taxi
  class Vehicle
    include DataMapper::Resource

    property :id,               Serial #,    key: true
    property :registration,     String,  required: true
    property :make,             String,  required: true
    property :type,             String,  required: true
    property :date_of_reg,      Date,    required: true
    property :taxi_plate,       String,  required: true
    property :number_of_seats,  Integer, required: true
    property :driver_1,         Integer, required: true
    property :driver_2,         Integer
    property :colour,           String,  required: true
    property :owner_id,         Integer
    property :owner_type,       Enum[:person, :organisation], default: :person

    property :created_at, DateTime
    property :updated_at, DateTime

    has n, :licenses
    has n, :mileages

    def driver
      Taxi::Person.get(self.driver_1)
    end

    def drivers
      pr = Taxi::Person.properties[:id]
      d = Taxi::Person.all(id: [self.driver_1, self.driver_2].select{|id| pr.valid?(id)})
      # return driver unless d.size > 1
      d
    end

    def owner
      type = self.owner_type
      raise  Taxi::OwnerTypeError, 'The owner_id or owner_type are not available' unless type

      case type
      when :organisation
        driver = Taxi::Organisation.get(self.owner_id)
      when :person
        driver = Taxi::Person.get(self.owner_id)
      end

      driver
    end

  end #Vehicle

  class Mileage
    include DataMapper::Resource

    property :id,       Serial #, key: true
    property :at,       Flag[:start_of_shift, :end_of_shift, :last_service, :fueling]
    property :comment,  Text

    property :created_at, DateTime
    property :updated_at, DateTime

    belongs_to :vehicle
  end #Mileage

  class OwnerTypeError < StandardError
  end #OwnerTypeError

end

