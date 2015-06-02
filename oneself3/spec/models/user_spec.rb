require 'spec_helper'

describe User do

  before do
  	@user = User.new(uid: "781912261924415", provider: "facebook", name: "Akiyoshi Okano", email: "akiyoshiokano0415@gmail.com") 
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:papers) }


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
  #  let!(:older_paper) do
  #    user.papers.create!(content: "Lorem ipsum" , created_at: 1.day.ago )
  #  end
  #  let!(:newer_paper) do
  #    user.papers.create!(content: "Lorem ipsum" , created_at: 1.hour.ago)
  #  end
  #
  #  it "should have the right microposts in the right order" do
  #    expect(@user.papers.to_a).to eq [newer_paper, older_paper]
  #  end
  #end

  #it "should destroy associated microposts" do
  #    papers = @user.papers.to_a
  #    @user.destroy
  #    expect(papers).not_to be_empty
  #    papers.each do |paper|
  #      expect(Paper.where(id: paper.id)).to be_empty
  #  end
  #end
end
