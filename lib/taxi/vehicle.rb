module Taxi
  class Vehicle
    attr_accessor :registration, :make, :model, :type, :date_of_reg, :reg_plate, :number_of_seats, :driver

    def initialize(registration, options = [])
      raise Exception if registration.empty?
      @registration = registration
      @options ||= options
    end

    def driver
      @driver ||= Taxi::Person.new('Nelson', 'Kelem', :driver)
    end

  class Mileage
    attr_accessor :at_start, :at_finish, :at_last_service, :last_service_date

    def initialize(vehicle, at_finish, at_start)
      @vehicle, @at_finish, @at_start = vehicle, at_finish, at_start
    end
  end #Mileage
  end #Vehicle
end

