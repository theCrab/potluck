require "spec_helper"

describe 'Taxi::License' do
  it "should have a number" do
    Taxi::License.new(12345).should respond_to :number
  end
  it "should have a valid expiry date" do
    expect(Taxi::License.expiry_date).to be <= Date.today
  end
  it "should have a valid issuerer"
  it "should have a valid type"
end
