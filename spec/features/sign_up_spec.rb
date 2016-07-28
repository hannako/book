# Write a failing feature test that checks the following:
#  when a user signs up, the User count increases by 1
#  the page displays a welcome message to the new user
#  the email address for that user in the database is correct.

feature 'Creating user account' do

  scenario 'the user is able to sign up' do

    visit '/'
    fill_in :name, with: 'Arunas'
    fill_in :email, with: 'Arunas@gmail.com'
    fill_in :password, with: 'password1234'


    expect{ click_button 'Register' }.to change{ User.all.count }.by(1)
    expect(page).to have_content 'Welcome Arunas!'

    user = User.first
    expect(user.email).to eq 'Arunas@gmail.com'

  end
end
