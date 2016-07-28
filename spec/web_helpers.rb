def sign_up
  visit '/users/new'
  expect(page.status_code).to eq 200
  fill_in :name, with: "Arunas"
  fill_in :email, with: "arunas@gmail.com"
  fill_in :password, with: "password1234"
  click_button 'Register'
end
