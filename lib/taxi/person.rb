module Taxi
  class Person
    include DataMapper::Resource

    property :id, Serial
    property :first_name, String, key: true
    property :last_name, String, key: true

    property :created_at, DateTime
    property :updated_at, DateTime

    has n, :roles
  end

  class Role
    include DataMapper::Resource

    property id: Serial
    property :name, Falg[:passenger, :driver, :dispatcher], default: :passenger

    property :created_at, DateTime
    property :updated_at, DateTime
  end
end