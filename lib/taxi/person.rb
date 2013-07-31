module Taxi
  class Person
    include DataMapper::Resource

    property :id,         Serial #,   key: true
    property :first_name, String, required: true
    property :last_name,  String, required: true
    property :email,      String, required: true, format: :email_address
    property :phone,      String
    property :mobile,     String, required: true
    property :ni_number,  String, required: true
    property :dob,        Date,   required: true
    property :left_on,    Date
    property :active,     Boolean, required: true, default: false
    property :caller_number, String, required: true

    property :created_at, DateTime
    property :updated_at, DateTime

    # has n, :roles
    has 1, :address
    has n, :licenses
  end

  # class Role
  #   include DataMapper::Resource

  #   property :id,         Serial
  #   property :name,       Flag[:passenger, :driver, :dispatcher], default: :passenger

  #   property :created_at, DateTime
  #   property :updated_at, DateTime

  #   belongs_to :person
  # end
end