# As a time-pressed user
# So that I can organise my many links into different categories for ease of search
# I would like to tag links in my bookmark manager

feature 'Tagging links' do
  scenario ' so i can have different categories, i tag links' do
    visit '/links/new'
    fill_in :title, with: 'MHWoodwork'
    fill_in :url, with: 'www.mhwoodwork.co.uk'
    fill_in :tags, with: 'work'
    click_button 'Submit'

    expect(current_path).to eq '/links'

    link = Link.first
    expect(link.tags.map(&:name)).to include('work')
  end

end
