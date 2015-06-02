require 'spec_helper'

describe User do

  before do
    @user = User.new(name: "Example User", email: "user@example.com")
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:microposts) }


  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  #describe "micropost associations" do
  #
  #  before { @user.save }
  #  let!(:older_micropost) do
  #    FactoryGirl.create(:micropost, user: @user, created_at: 1.day.ago)
  #  end
  #  let!(:newer_micropost) do
  #    FactoryGirl.create(:micropost, user: @user, created_at: 1.hour.ago)
  #  end
  #
  #  it "should have the right microposts in the right order" do
  #    expect(@user.microposts.to_a).to eq [newer_micropost, older_micropost]
  #  end
  #end
end
