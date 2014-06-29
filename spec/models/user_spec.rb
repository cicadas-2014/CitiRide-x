require 'spec_helper'

describe User do
  it "is valid with a username, email, password" do
    user = User.new(
      username: "abc",
      email: "foo@bar.com",
      password: "123456"
      )
    expect(user).to be_valid
  end

  it "is invalid without an email" do
    expect(User.new(email: nil)).to have(1).errors_on(:email)
  end

  it "is invalid without a password" do
    expect(User.new(password: nil)).to have(1).errors_on(:password)
  end

  it "is invalid without a username" do
    expect(User.new(username: nil)).to have(1).errors_on(:username)
  end

  it "is invalid with a duplicate email" do
    User.create(username: "abc",
      email: "foo@bar.com",
      password: "123456"
      )
    user = User.new(username: "dbc", email: "foo@bar.com", password: "123456")
    expect(user).to have(1).errors_on(:email)
  end

  it "is invalid with a duplicate username" do
    User.create(username: "abc",
      email: "foo@bar.com",
      password: "123456",
      password_confirmation: "123456"
      )
    user = User.new(username: "abc", email: "foo1@bar.com", password: "123456")
    expect(user).to have(1).errors_on(:username)
  end

  let(:user) {build(:user)}
  it "should have many rides" do
    expect(user).to respond_to :rides
  end
end
