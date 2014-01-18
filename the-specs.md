## SPECIFICATIONS

The Vehicle
===========
Vehicle minimum basic requirements.
1. Make
2. Registration plate
3. Carrying capacity
6. Owner
7. Colour
8. Type

The Company
===========
1. name
2. Address
3. Owner
4. Phone-numbers
5. Emails
6. number

The User
===========
1. type (driver, passenger)
2. username
3. password
4. Full Name
5. Address
6. Phone number
7. Email address

The Booking
===========
1. passenger (User)
2. Vehicle
3. driver (User)
4. Pick-up address
5. Pick-up time
4. Drop-off address
5. Drop-off time

The Address
============
class Address < ContactDetail
  include DataMapper::Resource

  property :id, Serial
  property :street_1, String
  property :street_2, String
  property :city, String
  property :county, String
  property :post-code, String
  property :country, String
end

E-mail
======
class Email
  include ContactDetail, DataMapper::Resource

  property :id, Serial
  property :content, String
  property :type, Enum[:primary, :work, :home], default: :primary
  property :active, Boolean, default: true
end

Phone
======
class Phone
  include ContactDetail, DataMapper::Resource

  property :id, Serial
  property :number, Integer
  property :type, Enum[:primary, :work, :home], default: :primary
  property :active, Boolean, default: true
end

class ContactDetail
  def type
    raise NotImplementedError, 'Ask the subclass, or implement it yourself'
  end
end
