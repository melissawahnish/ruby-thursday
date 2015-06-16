module RubyThursday
  module Features
    module Authentication
      def login_admin(email, password)
        visit new_admin_session_path
        
        fill_in("admin[email]", with: email)
        fill_in("admin[password]", with: password)
        click_on("Log in")
       
        expect(page).to have_content("Signed in successfully.")
      end
    end
    module Starship
      def create_starship
        visit new_starship_path
        fill_in("starship[name]", with: "Enterprise")
        click_button "Create Starship"
      end  
      def create_starship_with_crew_member(crew_name)
        visit new_starship_path
        fill_in("starship[name]", with: "Enterprise")
        fill_in("starship[crew_members_attributes][0][name]", with: crew_name)
        select('Science', :from => "starship[crew_members_attributes][0][division]")
        click_button "Create Starship"
      end
    end 
  end
end

RSpec.configure do |config|
  config.include RubyThursday::Features::Authentication, type: :feature
  config.include RubyThursday::Features::Starship, type: :feature
end    