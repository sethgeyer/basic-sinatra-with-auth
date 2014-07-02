feature "homepage" do
  before(:each) do
    visit "/"
  end
  scenario "shows a registration button" do
    expect(page).to have_content("Register")
  end
  scenario "visitor routes to new_user_registration when 'Register' button is clicked" do
    click_on "Register"
    expect(page).to have_content("Username")
  end
  scenario "shows login form" do
    expect(page).to have_button("Log In")
  end

  scenario "user completes form and submits" do
    fill_in "name", with: "Seth"
    fill_in "password", with: "seth"
    click_on "Log In"
    expect(page).to have_content("Welcome, Seth")
  end

  scenario "user is logged in" do
    fill_in "name", with: "Seth"
    fill_in "password", with: "seth"
    click_on "Log In"
    expect(page).to have_content("Log Out")
  end
end