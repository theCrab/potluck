require "spec_helper"

describe Taxi::Vehicle do

  let(:driver) { Taxi::Person.create(attributes_for(:person)) }
  let(:vehicle) { Taxi::Vehicle.new(attributes_for(:vehicle)) }
  after(:all) do
    vehicle.destroy
    driver.destroy
  end

  context "Details" do
    # it "should have a valid registration" do
    #   expect(vehicle.registration).to eql('N880 PFW')
    # end

    # it "should have a make" do
    #   expect(vehicle.make).to eql('BMW')
    # end

    # it "should have a colour" do
    #   expect(vehicle.colour).to eql('Maroon')
    # end

    # it "should have Seat capacity" do
    #   expect(vehicle.number_of_seats).to eql(7)
    # end
  end

  # context "When first added" do
  #   before do
  #     vehicle.owner_id = driver.id
  #     vehicle.owner_type = :person
  #     vehicle.driver_1 = driver.id
  #     # binding.pry
  #     vehicle.save
  #   end

  #   it "should have an owner" do
  #     # binding.pry
  #     vehicle.owner.should == driver
  #   end

  #   it "should be success" do
  #     vehicle.should be_valid
  #   end
  # end

  # context "Certificates" do
  #   before do
  #     vehicle.owner_id = driver.id
  #     vehicle.owner_type = :person
  #     vehicle.driver_1 = driver.id
  #     # binding.pry
  #     vehicle.save
  #   end

  #   let(:license) {vehicle.licenses.new({
  #         number: 'KELE807070',
  #         provider: 'Aviva Insurance',
  #         starts_on: Date.today,
  #         expires_on: Date.today + 60,
  #         type: :insurance,
  #         active: true })}

  #   after(:each) do
  #     license.destroy
  #   end

  #   it "should be added successfully" do
  #     # binding.pry
  #     expect { license.save }.to change{ vehicle.licenses.count }.from(0).to(1)
  #     # expect(vehicle.licenses.count).to eql(1)
  #   end

  #   it "should have valid Insurance" do
  #     license.save
  #     l = vehicle.licenses.first
  #     expect(l.starts_on < l.expires_on).to be_true
  #     expect(l.type).to be(:insurance)
  #   end

  #   it "should have valid Road-tax" do
  #     license.type = :road_tax
  #     license.save
  #     expect(vehicle.licenses.first.type).to be(:road_tax)
  #   end

  #   it "should have valid Taxi Lincense Badge" do
  #     license.type = :vehicle_badge
  #     license.save
  #     expect(vehicle.licenses.first.type).to be(:vehicle_badge)
  #   end
  # end

  # context "Driver" do
  #   before do
  #     vehicle.owner_id = driver.id
  #     vehicle.owner_type = :person
  #     vehicle.driver_1 = driver.id
  #     # binding.pry
  #     vehicle.save
  #   end

  #   it "should have a driver"do
  #     vehicle.driver.should == driver
  #     # expect { vehicle.driver }.to throw_symbol(:driver)
  #   end

  #   it "can have one more driver" do
  #     # vehicle.driver_2 = Taxi::Person.create(attributes_for(:person)).id
  #     # vehicle.driver_2 = driver_2.id
  #     # binding.pry
  #     expect(vehicle.drivers).to include(driver)
  #   end
  # end

  # context "Given a bad list of drivers" do
  #   let(:bad_driver) { {} }
  # end

  # context "Given a bad list of cars" do
  #   let(:bad_car) { {} }
  # end
end

