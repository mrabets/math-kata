RSpec.describe 'Session process', type: :system do

  describe "The log in process", type: :feature do
    
    let(:user) { User.create!(email: 'user@example.com', password: 'password', password_confirmation: 'password') }
    

    it "logins me in" do
      visit '/d/users/sign_in'

      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'

      click_button 'Log in'
      expect(page).to have_content 'Signed in successfully'
    end
  end

  describe "The sign up process", type: :feature do
    it "signups me in" do
      visit '/d/users/sign_up'

      fill_in 'Email', with: 'user2@example.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'

      click_button 'Sign up'
      expect(page).to have_content 'signed up successfully'
    end
  end

  describe "The log in process", type: :feature do
    
    let(:user) { User.create!(email: 'user@example.com', password: 'password', password_confirmation: 'password') }

    it "logouts me in" do
      visit '/d/users/sign_in'

      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'

      click_button 'Log in'

      click_button 'user@example.com'
      click_link 'Log out'    

      expect(page).to have_content 'Signed out successfully.'
    end
  end
end