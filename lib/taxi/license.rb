module Taxi
  class License
    attr_accessor :number, :expiry_date

    def initialize(number)
      @number, @expiry_date = number, expiry_date
    end

    def self.expiry_date
      @expiry_date ||= Date.today - 5
    end
  end
end