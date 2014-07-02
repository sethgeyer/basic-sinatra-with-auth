feature "vistor visits page for first time" do
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
end

feature "user has already logged in" do
  before(:each ) do
    visit "/"
    click_on "Register"
    fill_in "name", with: "Seth"
    fill_in "password", with: "seth"
    click_button "Submit"
    fill_in "name", with: "Seth"
    fill_in "password", with: "seth"
    click_on "Log In"
  end

  scenario "user is logged in" do
    expect(page).to have_link("Log Out")
  end

  scenario "user logs out" do
    click_link("Log Out")
    expect(page).to have_content("Register")
    expect(page).to have_content("Log In")
  end

end