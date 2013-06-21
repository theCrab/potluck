require "spec_helper"

describe Taxi::Vehicle do
  let(:vehicle) { FactoryGirl.create(:vehicle) }
  # before do
  #   subject { create(:vehicle, registration: 'N880 PFW') }
  # end

  it "should have a make"
  it "should have a registration" do
    # expect{vehicle.registration}.not_to raise_error(Exception)
    its(:registration) { should eq 'N880 PFW' }
  end
  it "should have a model"
  it "should have a driver"
  it "should have a colour"
  it "should have a owner"
  it "should have a Date of registration"
  it "should have Seat capacity"
  it "should have valid MOT"
  it "should have valid Insurance"
  it "should have valid Road-tax"
  it "should have valid Taxi Lincense Badge"
end