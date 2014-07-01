feature "homepage" do
  scenario "shows a registration button" do
    visit "/"
    expect(page).to have_button("Register")
  end
end