module Taxi
  class Payment
    include Adamantium, DataMapper::Resource
    # Payment[type: [:card, :cash, :account], :charge, :charge_per_mile]

    property :id, Serial
    property :type, Enum[:cash, :card, :account], default: :cash
  end
end