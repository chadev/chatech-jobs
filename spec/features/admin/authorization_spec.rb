require 'rails_helper'

feature "Admin authorization" do
  let(:admin_login) { 'admin/login' }

  def sign_in(user)
    visit admin_login

    within '#session_new' do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
    end
    click_button 'Login'
  end

  scenario "When a non-admin user signs in" do
    user = create(:user)
    sign_in(user)
    expect(page).to have_title('Chadev+Jobs')
  end

  scenario "When an admin signs in" do
    user = create(:user, :admin => true)
    sign_in(user)
    expect(page).to have_title('Dashboard | Chatech Job Board')
    expect(page).to have_content('Welcome to the Chadev Jobs Admin')
  end
end