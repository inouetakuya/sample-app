require 'spec_helper'

describe "Authentication" do
  subject { page }

  describe 'signin page' do
    before { visit signin_path }

    it { should have_selector('h1', text: 'Sign in') }
    it { should have_selector('title', text: 'Sign in') }
  end

  describe 'signin' do
    before { visit signin_path }

    describe 'with invalid information' do
      before { click_button 'Sign in' }

      it { should have_selector('title', text: 'Sign in') }
      it { should have_selector('div.alert.alert-error', text: 'invalid') }

      describe 'after visiting another page' do
        before { click_link 'Home' }
        before { click_link 'Home' }  # 1回 render しただけでは、メッセージが残ってしまうというバグ

        it { should_not have_selector('div.alert.alert-error') }
      end
    end

    describe 'with valid information' do
      let(:user) { FactoryGirl.create(:user) }
      before { sign_in user }


      it { should have_selector('title', text: user.name) }
      it { should have_link('Profile', href: user_path(user)) }
      it { should have_link('Settings', href: edit_user_path(user)) }
      it { should have_link('Sign out', href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
    end
  end

  describe 'authorization' do
    describe 'for non-signed-in users' do
      let(:user){ FactoryGirl.create(:user) }

      describe 'in the Users controller' do
        describe 'visiting the edit page' do
          before { visit edit_user_path(user) }
          it { should have_selector('title', text: 'Sign in') }
        end

        describe 'submitting to the update action' do
          before { put user_path(user) }
          specify { response.should redirect_to(signin_path) }
        end
      end
    end

    describe 'as wrong user' do
      let(:user){ FactoryGirl.create(:user) }
      let(:wrong_user){ FactoryGirl.create(:user, email: 'wrong@example.com') }
      before { sign_in user }

      describe 'visiting Users#edit page' do
        before { visit edit_user_path(wrong_user) }
        it { should_not have_selector('title', text: full_title('Edit user')) }
      end

      describe 'submitting a PUT request to the User#update action' do
        before { put user_path(wrong_user) }
        specify { response.should redirect_to(root_path) }
      end
    end
  end

  #describe "GET /authentication_pages" do
  #  it "works! (now write some real specs)" do
  #    # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
  #    get authentication_pages_index_path
  #    response.status.should be(200)
  #  end
  #end
end
