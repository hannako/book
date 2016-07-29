# Write a failing feature test that checks that:
#  A user can sign out
#  A goodbye message is displayed on signing out
#  The user is redirected to /link
#
feature 'Signing a user out' do

  let(:user) do
    User.create(name: 'user',
                email: 'user@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'a user can sign out of a session' do
    sign_in(email: user.email, password: user.password)
    click_button 'Sign out'
    expect(page).to have_content 'Goodbye'
    expect(page).not_to have_content 'Welcome user!'
    expect(current_path).to eq '/links'
  end

end
