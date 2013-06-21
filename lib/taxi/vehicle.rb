module Taxi
  class Vehicle
    attr_accessor :registration

    def initialize(registration, options = {})
      raise Exception if registration.empty?
      @registration = registration
    end


    class Mileage
      attr_accessor :at_start, :at_finish, :at_last_service, :last_service_date

      def initialize(vehicle, at_finish, at_start)
        @vehicle, @at_finish, @at_start = vehicle, at_finish, at_start
      end
    end #Mileage
  end #Vehicle
end