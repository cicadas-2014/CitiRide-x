require 'spec_helper'

describe Station do
  it "is invalid without a name" do
    expect(build(:station, name: nil)).to have(1).errors_on(:name)
  end

  it "is invalid without a latitude" do
    expect(build(:station, latitude: nil)).to have(1).errors_on(:latitude)
  end

  it "is invalid without a longitude" do
    expect(build(:station, longitude: nil)).to have(1).errors_on(:longitude)
  end
end
