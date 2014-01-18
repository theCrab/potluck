require "spec_helper"

describe 'Taxi::License' do
  let(:license) { Taxi::License.new(attributes_for(:license)) }
  let(:vehicle) { Taxi::Vehicle.new(attributes_for(:vehicle)) }

  after(:all) do
    license.destroy
    vehicle.destroy
  end
  # context "on creation" do
  #   let(:user) { Taxi::Person.create(attributes_for(:person)) }

  #   before do
  #     vehicle.driver_1    = user.id
  #     vehicle.owner_id    = user.id
  #     # vehicle.owner_type  = :person
  #     # binding.pry
  #     vehicle.save

  #     license.person  = user
  #     license.vehicle = vehicle
  #     # binding.pry
  #     license.save
  #   end
  #   after(:all) do
  #     user.destroy
  #   end

  #   it "should have a number" do
  #     # expect(user.first_name).to be_instance_of(String)
  #     expect(license.vehicle.taxi_plate).to eql('JVMNKD1209')
  #     expect(license.person.first_name).to eql(user.first_name)
  #   end
  #   it "should have a valid expiry date" do
  #     expect(license.starts_on < license.expires_on).to be_true
  #   end
  #   it "should have a valid license provider" do
  #     expect(license.provider).to eql('DVLA')
  #   end
  #   it "should have a default type" do
  #     expect(license.type).to eql(:mot)
  #   end
  # end
end
