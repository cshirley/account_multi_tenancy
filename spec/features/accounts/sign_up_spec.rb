require "rails_helper"
feature "Accounts" do
  scenario "creating an account" do
    visit account_multi_tenancy.root_path
    click_link "Account Sign Up"
    fill_in "Name", :with => "Test"
    fill_in "Subdomain", :with => "test"
    fill_in "Email", :with => 'tenant@example.com'
    fill_in "Password", :with => 'password', :exact => true
    fill_in "Password confirmation", :with => 'password'

    click_button "Create Account"
    success_message = "Signed in as tenant@example.com"
    expect(page).to have_content(success_message)
    expect(page.current_url).to eq("http://test.example.com/")

  end
  scenario "Ensure subdomain uniqueness" do
    AccountMultiTenancy::Account.create!(:subdomain => "test", :name => "Test")
    visit account_multi_tenancy.root_path
    click_link "Account Sign Up"
    fill_in "Name", :with => 'Test'
    fill_in "Subdomain", :with => 'test'
    fill_in "Email", :with => 'tenant@example.com'
    fill_in "Password", :with => 'password', :exact => true
    fill_in "Password confirmation", :with => 'password'
    click_button "Create Account"
    expect(page.current_url).to eq("http://www.example.com/accounts")
    expect(page).to have_content("Sorry, your account could not be created.")
    expect(page).to have_content("Subdomain has already been taken")
  end
  scenario "Subdomain with restricted name" do
    visit account_multi_tenancy.root_path
    click_link "Account Sign Up"
    fill_in "Name", :with => "Test"
    fill_in "Subdomain", :with => "admin"
    fill_in "Email", :with => "subscribem@example.com"
    fill_in "Password", :with => "password"
    fill_in "Password confirmation", :with => "password"
    click_button "Create Account"
    expect(page.current_url).to eq("http://www.example.com/accounts")
    expect(page).to have_content("Sorry, your account could not be created.")
    expect(page).to have_content("Subdomain is not allowed")
  end
  scenario "Subdomain with invalid name" do
    visit account_multi_tenancy.root_path
    click_link "Account Sign Up"
    fill_in "Name", :with => "Test"
    fill_in "Subdomain", :with => "<admin>"
    fill_in "Email", :with => "subscribem@example.com"
    fill_in "Password", :with => "password"
    fill_in "Password confirmation", :with => "password"
    click_button "Create Account"
    expect(page.current_url).to eq("http://www.example.com/accounts")
    expect(page).to have_content("Sorry, your account could not be created.")
    expect(page).to have_content("Subdomain is not allowed. Please choose another subdomain.")
  end


end

