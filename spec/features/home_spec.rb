feature "homepage" do
  scenario "shows a registration button" do
    visit "/"
    expect(page).to have_content("Register")
  end
  scenario "visitor routes to new_user_registration when 'Register' button is clicked" do
    visit "/"
    click_on "Register"
    expect(page).to have_content("Username")
  end
end