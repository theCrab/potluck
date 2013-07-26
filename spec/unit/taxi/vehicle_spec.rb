require "spec_helper"

describe Taxi::Vehicle do
  let(:vehicle) { Taxi::Vehicle.new('N880 PFW') }

  it "should have a registration" do
    vehicle.should respond_to :registration
    vehicle.registration.should_not be_empty
    vehicle.registration.should eq('N880 PFW')
  end
  it "should have a make" do
    vehicle.make.should be_nil

    vehicle.make = 'BMW'
    vehicle.make.should eq('BMW')
  end
  it "should have a model" do
    vehicle.model.should be_nil

    vehicle.model = '1800LS'
    vehicle.model.should eq('1800LS')
  end

  it "should have a colour"
  it "should have a owner"
  it "should have a Date of registration"
  it "should have Seat capacity"
  it "should have valid MOT"
  it "should have valid Insurance"
  it "should have valid Road-tax"
  it "should have valid Taxi Lincense Badge"

  context "Driver" do
    it "should have a driver"do
      vehicle.should respond_to :driver

      vehicle.driver.should be(:driver)
      # expect { vehicle.driver }.to throw_symbol(:driver)
    end
  end
  context "given a bad list of cars" do
    let(:bad_car) { {} }
  end
end

