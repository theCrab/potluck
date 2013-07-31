require "spec_helper"

describe Taxi::Person do
  let(:user) { Taxi::Person.create(attributes_for(:person)) }
  after(:all) do
    user.destroy
  end

  context "on create" do
    # binding.pry
    it "should be valid" do
      user.should be_valid
      user.should be_instance_of(Taxi::Person)
    end

    it "should have a valid NI Number" do
      expect(user.ni_number).to eql('SH269093B')
    end

    it "should have a DOB" do
      expect(user.dob.to_s).to eql(Date.today.to_s)
    end

    it "should have a join date" do
      expect(user.created_at).to be_instance_of(DateTime)
    end

    it "should have a leave/termination date" do
      expect(user.active).to be(false)
      expect(user.left_on).to be_nil
    end

    it "should have a Call Sign" do
      expect(user.caller_number).to include('DR', '0')
      expect(user.caller_number).to start_with('DR')
    end
  end

  context "Contact details" do
    let(:address) { Taxi::Address.new(attributes_for(:address)) }
    after(:all) do
      address.destroy
    end
    it "should have a verified phone number" do
      expect(user.phone).not_to be('')
      expect(user.mobile).not_to be('')
    end

    it "should have a verified email" do
      expect(user.email).not_to be_nil
    end

    it "should have a valid address" do
      address.person = user
      address.save
      expect(address.person_id).to eql(user.id)
    end
  end

  context "Licenses" do
    it "should have a valid 'Insurance policy'"
    it "should have a valid 'Taxi badge (PCO Lincense Number)'"
    it "should have a valid 'Driving License'"
  end
  context "Company Roles" do
    it "should belong to an Organisation"
    it "should have a role(s)" #do
      # expect(user.roles).to include()
    #end
  end
end
