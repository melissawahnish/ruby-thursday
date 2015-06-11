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
  end
end

RSpec.configure do |config|
  config.include RubyThursday::Features::Authentication, type: :feature
end    