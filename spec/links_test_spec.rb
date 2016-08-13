# As a time-pressed user
# So that I can quickly go to web sites I regularly visit
# I would like to see a list of links on the homepage

feature 'Links on the homepage' do

  scenario 'I can see links on my links page' do
    Link.create( url: 'www.makersacademy.com', title: 'Makers Academy')
    visit '/links'
      within 'ul#links' do
        expect(page).to have_content('www.makersacademy')
      end
  end

  # As a time-pressed user
  # So that I can save a website
  # I would like to add the site's address and title to my bookmark manager

  scenario 'I can add links to my links page' do
    visit '/links'
    click_button 'add link'
    fill_in 'title', with: 'BBC News'
    fill_in 'url', with: 'www.bbc/news.co.uk'
    click_button 'submit'
      within 'ul#links' do
        expect(page).to have_content('www.bbc/news.co.uk')
      end
  end

end
