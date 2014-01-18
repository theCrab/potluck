module Taxi
  class Person
    include DataMapper::Resource #, Adamantium

    # Driver[badge_no dob ni_number full_name address phone email ]

    property :id,         Serial #,   key: true
    property :first_name, String, required: true
    property :last_name,  String, required: true
    property :email,      String, required: true, unique: true, format: :email_address
    property :phone,      String
    property :mobile,     String, required: true
    property :ni_number,  String, required: true, unique: true
    property :dob,        Date,   required: true
    property :left_on,    Date
    property :active,     Boolean, default: false
    property :callsign,   String, required: true, unique: true
    property :badge_no,   String, required: true, unique: true

    ### Timestamps ####
    property :created_at, DateTime
    property :updated_at, DateTime

    ### Associations ####
    # has 1, :address
    # has n, :licenses
    # has n :teams, through: Resource
    # has n, :organisations

    ### Validations ####
    before :valid?, :generate_call_number

    def can_work?(user)
      (user.active? && is_clear?(user)) ? true : false
    end

    private
    # generates a unique callsign for every org driver
    # combines org name and a random (3 digit) number
    #
    # @api private
    def generate_call_number
      self.callsign = "D#{rand(999)}"
    end

    # Checks validity of this driver and vehicle licenses
    # returns [Boolean]
    #
    # @api private
    def is_clear?(user)
      user.licenses.compact.all? { |license| license.expires_on =< Date.today }
    end
  end

end