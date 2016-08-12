
feature 'Links on the homepage' do
  scenario 'I can see links on my homepage' do
    Link.create( url: 'www.makersacademy.com')
    visit '/'
    expect (page).to have_content('www.makersacademy')
  end
end

# As a time-pressed user
# So that I can quickly go to web sites I regularly visit
# I would like to see a list of links on the homepage
