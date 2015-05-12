require 'rails_helper'

feature "Admin" do

	#communicate purpose first thing
  scenario "admin sees hackers after login" do
    Given "admin is signed in"
    When "admin views all hackers"
    Then "admin sees the first hacker"
  end

  #set up objects
  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:hacker) { FactoryGirl.create(:hacker) }

  #define methods from scenario
  def admin_is_signed_in
    visit root_path
    click_link "Admin Sign in"
    fill_in "admin[email]", with: admin.email
    fill_in "admin[password]", with: admin.password
    click_button "Log in"
  end

  def admin_views_all_hackers
  	click_link "View Hacker List"
    expect(page).to have_content("Hacker List")
  end

  def admin_sees_the_first_hacker
    expect(page).to have_content(hacker.email)
  end

end