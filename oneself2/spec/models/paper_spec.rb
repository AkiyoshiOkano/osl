require 'spec_helper'

describe Paper do

  let(:user) { FactoryGirl.create(:user) }
  before do
    # このコードは慣用的な意味で正しくない。
    @paper = Paper.new(content: "Lorem ipsum", user_id: user.id)
  end

  subject { @paper }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
end