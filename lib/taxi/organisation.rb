module Taxi
  class Organisation
    include Adamantium, DataMapper::Resource

    property :id, Serial
    property :name, String, length: 3..15

    property :created_at, DateTime
    property :updated_at, DateTime

    # has 1, :address
    has n, :teams
    has n, :people, through: :teams
  end

  class Team
    include Adamantium, DataMapper::Resource

    property :id, Serial
    property :name, String, required: true
    property :permission, Enum[:admin, :driver, :dispatch], default: :driver

    property :created_at, DateTime
    property :updated_at, DateTime

    belongs_to :organisation
    has n, :people, through: Resource
  end
end