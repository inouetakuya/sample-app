# -*- encoding: utf-8 -*-

require 'spec_helper'

describe "StaticPages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    #it "should have the h1 'Sample App'" do
    #  # visit '/static_pages/home'
    #  # visit root_path
    #  page.should have_selector('h1', text: 'Sample App')
    #end
    it { should have_selector('h1', text: 'Sample App') }

    #it "should have the base title" do
    #  # visit '/static_pages/home'
    #  # visit root_path
    #  page.should have_selector('title',
    #    :text => "Ruby on Rails Tutorial Sample App")
    #end
    # it { should have_selector('title', text: "Ruby on Rails Tutorial Sample App") }
    it { should have_selector('title', text: full_title('')) }

    #it "should not have a custom page title" do
    #  # visit '/static_pages/home'
    #  # visit root_path
    #  page.should_not have_selector('title',
    #    :text => "| Home")
    #end
    it { should_not have_selector('title', text: '| Home')}
  end

  describe "Help page" do
    it "should have the content 'Help'" do
      # visit '/static_pages/help'
      visit help_path
      page.should have_content('Help')
    end

    it "should have the right title" do
      # visit '/static_pages/help'
      visit help_path
      page.should have_selector('title',
        :text => "Ruby on Rails Tutorial Sample App | Help")
      page.should have_selector('title',
        :text => full_title('Help'))
    end
  end

  describe "About page" do
    it "should have the content 'About Us'" do
      # visit '/static_pages/about'
      visit about_path
      page.should have_content('About Us')
    end
  end

  describe "Contact page" do
    it "should have the h1 'Contact'" do
      # visit '/static_pages/contact'
      visit contact_path
      page.should have_selector('h1', text: 'Contact')
    end

    it "should have the title 'Contact'" do
      # visit '/static_pages/contact'
      visit contact_path
      page.should have_selector('title',
        text: 'Ruby on Rails Tutorial Sample App | Contact')
    end
  end

  #describe "GET /static_pages" do
  #  it "works! (now write some real specs)" do
  #    # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
  #    get static_pages_index_path
  #    response.status.should be(200)
  #  end
  #end
end
