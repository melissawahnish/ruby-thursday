require 'rails_helper'

feature "Starship with Crew Members" do
  #communicate purpose upfront with Simple BDD
  scenario "visitor can create starship with crew members" do
    Given "visitor can view new starship form"
    When "visitor enters information for starship and crew members"
    Then "visitor can see starship listing"
    Then "visitor receives starship email"
  end
  #define methods from scenario
  def visitor_can_view_new_starship_form
    visit new_starship_path
    expect(page).to have_content("New Starship")
  end

  def visitor_enters_information_for_starship_and_crew_members
    enter_starship_info
    enter_crew_members_info
    click_button "Create Starship"
  end

  def visitor_can_see_starship_listing
    expect(page).to have_content("USS Enterprise (NCC-1701-A)")
    expect(page).to have_content("James T. Kirk")
  end
  
  def visitor_receives_starship_email
    open_email('melissa@rubythursday.com')
    expect(current_email.to).to eq ["melissa@rubythursday.com"]
    expect(current_email.subject).to eq 'Starship Created'
    expect(current_email).to have_content('Congrats!')
    clear_emails
   end
  #define additional methods
  def enter_starship_info
    fill_in("starship[name]", with: "USS Enterprise (NCC-1701-A)")
    fill_in("starship[email]", with: "melissa@rubythursday.com")  
  end

  def enter_crew_members_info
    fill_in("starship[crew_members_attributes][0][name]", with: "James T. Kirk")
    select('Command', :from => "starship[crew_members_attributes][0][division]")
    fill_in("starship[crew_members_attributes][1][name]", with: "Spock")
    select('Science', :from => "starship[crew_members_attributes][1][division]")
    fill_in("starship[crew_members_attributes][2][name]", with: "Leonard McCoy")
    select('Engineering', :from => "starship[crew_members_attributes][0][division]")
  end
end