require 'spec_helper'

describe Ride do
  it "is invalid without a starting_point" do
    expect(build(:ride, starting_point: nil)).to have(1).errors_on(:starting_point)
  end

  it "is invalid without a destination" do
    expect(build(:ride, destination: nil)).to have(1).errors_on(:destination)
  end

  it "should belong to a user" do
    ride = Ride.new(starting_point: "48 Wall St", destination: "Empire State Building")
    expect(ride).to respond_to :user
  end
end
