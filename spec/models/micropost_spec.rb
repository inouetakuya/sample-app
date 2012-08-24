require 'spec_helper'

describe Micropost do
  let(:user){ FactoryGirl.create(:user) }
  before do
    # this code is wrong
    # @micropost = Micropost.new(content: 'Lorem ipsum', user_id: user.id)

    # micropost.user >> Return the User object associated with the micropost.
    # user.microposts >> Return an array of the user’s microposts.
    # user.microposts.create(arg) >> Create a micropost (user_id = user.id).
    # user.microposts.create!(arg) >> Create a micropost (exception on failure).
    # user.microposts.build(arg) >> Return a new Micropost object (user_id = user.id).
    @micropost = user.microposts.build(content: 'Lorem ipsum')
  end

  subject{ @micropost }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user){ should == user }

  it { should be_valid }

  describe 'accessible attributes' do
    it 'should not allow access to user_id' do
      expect do
        Micropost.new(user_id: user.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe 'when user_id is not present' do
    before { @micropost.user_id = nil }
    it { should_not be_valid }
  end

  describe 'with blank content' do
    before { @micropost.content = '' }
    it { should_not be_valid }
  end

  describe 'with content that is too long' do
    before { @micropost.content = 'a' * 141 }
    it { should_not be_valid }
  end

  # pending "add some examples to (or delete) #{__FILE__}"
end
