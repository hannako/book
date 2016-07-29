# Write a failing feature test that checks that:
#  A user can sign in
#  A welcome message is displayed to the user

feature 'Signing in to your account' do

  let(:user) do
    User.create(name: 'user',
                email: 'user@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'A user can sign in with correct creds' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome #{user.name}!"
  end

  scenario 'A user cannot sign in with incorrect creds' do
    expect(User.authenticate(user.email, 'wrong_stupid_password')).to be_nil
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end
end
