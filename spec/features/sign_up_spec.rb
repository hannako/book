# Write a failing feature test that checks the following:
#  when a user signs up, the User count increases by 1
#  the page displays a welcome message to the new user
#  the email address for that user in the database is correct.

feature 'Creating user account' do

  scenario 'the user is able to sign up' do

    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'Welcome alice!'

    user = User.first
    expect(user.email).to eq 'alice@example.com'
  end

# Write a failing feature test that checks that when a user signs up
#  with a mismatching password confirmation that no new users are created

  scenario 'the user has to reneter their password for validation check' do

    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content "Password and confirmation password do not match"
  end

end
