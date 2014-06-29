require 'spec_helper'

describe SearchesController do
  context "#show" do
    # let!(:ride_valid) { Ride.create(starting_point: '48 wall st new york', destination: '7 carmine st new york, ny')}
    # it "has valid status" do
    #   expect(GoogleDirections.new(ride_valid.starting_point, ride_valid.destination).status).to eq "OK"
    # end

    # let!(:ride_invalid) { Ride.create(starting_point: '48 wall st new york', destination: 'xyz')}
    # it "has invalid status" do
    #   expect(GoogleDirections.new(ride_invalid.starting_point, ride_invalid.destination).status).to eq "ZERO_RESULTS"
    # end

    it 'with valid address parameters' do
      post :show, { s: '48 wall st new york', d: '7 carmine st new york, ny'}
      expect(response).to render_template(:show)
    end

    it 'with invalid address parameters' do
      post :show, { s: 'xyz', d: '7 carmine st new york, ny'}
      expect(response).to redirect_to :index
    end

  end

  context '#index' do
    it "is successful" do
      get :index
      expect(response).to be_success
    end
  end

  context '#show' do
    it "is successful" do
      get :show
      expect(response).to be_success
    end
  end

  context '#login' do
    it 'is successful' do
      get :login
      expect(response).to be_success
    end
  end

  context '#signup' do
    it 'is successful' do
      get :signup
      expect(response).to be_success
    end
  end
end
