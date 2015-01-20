require 'rails_helper'

describe User do
  it "fails because no password" do
    @user = User.new(username: "rob")
    expect(@user.save).to eq(false)
  end
  it "fails if password and confirmation dont match" do
    @user = User.new(username: "rob",password: "abc123", password_confirmation: "def456")
    expect(@user.save).to eq(false)
  end
 it "fails if password is too short <=5" do
   @user = User.new(username: "rob",password: "abc12", password_confirmation: "abc12")
   expect(@user.save).to eq(false)
 end
 it "fails changing the password if authentication is wrong" do
   @user = User.new(username: "rob",password: "abc123", password_confirmation: "abc123")
   @user.save
   expect(@user.authenticate("abc")).to eq(false)
 end
 it "lets you change password if authenticate is right" do
   @user = User.new(username: "rob",password: "abc123", password_confirmation: "abc123")
   @user.save
   expect(@user.authenticate("abc123").update(password: "def456",password_confirmation: "def456")).to eq(true)
 end
end
