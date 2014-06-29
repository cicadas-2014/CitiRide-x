require 'spec_helper'

describe UsersController do

  describe '#signup' do
    context 'when valid params are passed' do
      it 'creates a new user' do
        expect {
          post :signup, attributes_for(:user)
        }.to change { User.count }.by(1)
      end
    end

    context 'when invalid params are passed' do
      it 'does not add user when the user is existing already' do
        create(:user, username: 'lol')
        expect {
          post :signup, attributes_for(:user, username: 'lol')
        }.to_not change { User.count }.by(1)
      end

      it 'does not add user when there is no input' do
        pending 'User count does not change'
      end
    end
  end

  describe '#login' do
    context 'when valid params are passed' do
      it 'assigns @user to user' do
        user = User.create(username: 'lol', email: 'omg@omg.com', password: '123', password_confirmation: '123')
        get :login, username: 'lol', email: 'omg@omg.com', password: '123'
        expect(assigns(:user)).to eq user
      end
    end

    context 'when invalid params are passed' do
      it 'does not log in' do # need to consider error messaging
        pending 'does nothing'
      end
    end
  end
end
