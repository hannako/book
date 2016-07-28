# As a time-pressed user
# So that I can quickly find links on a particular topic
# I would like to filter links by tag

feature 'Filtering links' do

  before(:each) do
    Link.create(url: 'http://www.mhwoodwork.co.uk', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
    Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'work')])
    Link.create(url: 'http://www.zombo.com', title: 'This is Zombocom', tags: [Tag.first_or_create(name: 'bubbles')] )
    Link.create(url: 'http://www.bubble-bobble.com', title: 'Bubble Bobble', tags: [Tag.first_or_create(name: 'bubbles')])
  end

  scenario 'so i can see tags on a specific subject' do
    visit '/tags/bubbles'
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).not_to have_content('Makers Academy')
      expect(page).not_to have_content('Google')
      expect(page).to have_content('Zombocom')
      expect(page).to have_content('Bubble Bobble')
      end
  end

end
