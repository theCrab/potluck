require "spec_helper"

describe Taxi::Person do
  subject(:user) { Taxi::Person.create(attributes_for(:person)) }
  after(:all) do
    user.destroy
  end

  context "on create" do
    it { should be_valid }
    it { should be_instance_of(Taxi::Person) }
    # its(:ni_number) { should_not be('') }
    it "should have a valid NI Number" do
      expect(user.ni_number).not_to eql('')
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
      expect(user.callsign).to include('D')
      expect(user.callsign).to start_with('D')
    end
  end

  context "Contact details" do
    subject(:address) { Taxi::Address.new(attributes_for(:address)) }
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

    it "should not save an address that does not belong to a person" do
      # binding.pry
      expect { address.save }.to raise_error(DataMapper::SaveFailureError)
    end

    it "should save a person's address" do
      address.person = user
      expect(address.save).to be_true
      # address.save
      expect(address.person_id).to eql(user.id)
    end
  end

  # context "Licenses" do
  #   it "should be a valid 'Insurance policy'"
  #   it "should be a valid 'Taxi badge (PCO Lincense Number)'"
  #   it "should be a valid 'Driving License'"
  # end

  # context "User Roles" do
  # default system roles are %w|driver dispatcher owner passenger|
  #   let(:organisation) { user.organisations.create(name: 'BBH Taxis') }
  #   let(:role) { organisation.roles.create(name: 'Driver') }
  #   it "should belong to an Organisation" do
  #     expect(user.organisations).to include(organisation)
  #   end

  #   it "should have a role(s)" do
  #    expect(user.roles).to include(role)
  #   end
  # end

  # context "Company Roles" do
  #   let(:organisation) { user.organisations.create(name: 'BBH Taxis') }
  #   it "should belong to an Organisation" do
  #     expect(user.organisations).to include(organisation)
  #   end

  #   it "should have a role(s)" do
  #    expect(user.roles).to include(role)
  #   end
  # end
end
