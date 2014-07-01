feature "new_user_registration_page" do
  before(:each) do
    visit "/users/new"
  end

  scenario "shows a registration form" do

    expect(page).to have_content("Username")
    expect(page).to have_content("Password")
    expect(page).to have_button("Submit")
  end

  scenario "user completes form and submits" do
    fill_in "name", with: "Seth"
    fill_in "password", with: "seth"
    click_on "Submit"
    expect(page).to have_content("Thank you for registering.")
  end


end