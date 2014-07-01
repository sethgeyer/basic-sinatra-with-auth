feature "new_user_registration_page" do
  scenario "shows a registration form" do
    visit "/users/new"
    expect(page).to have_content("Username")
    expect(page).to have_content("Password")
    expect(page).to have_button("Submit")
  end


end