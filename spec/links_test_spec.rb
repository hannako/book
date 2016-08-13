# US1
# As a time-pressed user
# So that I can quickly go to web sites I regularly visit
# I would like to see a list of links on the homepage
require 'pry'
feature 'Links on the homepage' do

  scenario 'I can see links on my links page' do
    Link.create( url: 'www.makersacademy.com', title: 'Makers Academy')
    visit '/links'
      within 'ul#links' do
        expect(page).to have_content('www.makersacademy')
      end
  end

  # <!-- US 2
  # As a time-pressed user
  # So that I can save a website
  # I would like to add the site's address and title to my bookmark manager -->
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

  # <!-- US 4
  # As a time-pressed user
  # So that I can organise my many links into different categories for ease of search
  # I would like to add tags to the links in my bookmark manager -->

  scenario 'I can tag links' do
    visit '/links'
    click_button 'add link'
    fill_in 'title', with: 'BBC News'
    fill_in 'url', with: 'www.bbc/news.co.uk'
    fill_in 'tag', with: 'news'
    click_button 'submit'
      within 'ul#links' do
        expect(page).to have_content('www.bbc/news.co.uk')
      end
    link = Link.first
    expect(link.tags.first.name).to eq('news')
    # expect(link.tags.map(&:name)).to include('news')
  end

  scenario 'I can add multiple tags' do
    visit '/links'
    click_button 'add link'
    fill_in 'title', with: 'BBC News'
    fill_in 'url', with: 'www.bbc/news.co.uk'
    fill_in 'tag', with: 'news politics'
    click_button 'submit'
      within 'ul#links' do
        expect(page).to have_content('www.bbc/news.co.uk')
      end
    link = Link.first
    # expect(link.tags.first.name).to eq('news')
    expect(link.tags.map(&:name)).to include('news','politics')
  end




  # US 5
  # As a time-pressed user
  # So that I can quickly find links on a particular topic
  # I would like to filter links by tag

  scenario 'I can filter my links by tag' do

    Link.create(title: 'bubblestuff', url: 'www.bubbles.co.uk',     tags: [Tag.create(name: 'bubbles')]         )
    Link.create(title: 'Google',      url: 'www.google.com', tags: [Tag.first_or_create(name: 'search')] )

    visit '/tags/bubbles'

      expect(page).to have_content('www.bubbles.co.uk')
      expect(page).not_to have_content('www.google.com')

  end









end
# require 'pry';binding.pry
