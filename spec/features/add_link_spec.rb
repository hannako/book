feature 'Adding links' do

  scenario 'I can add links to the links page' do
    visit '/links/new'
    fill_in :title, with: 'MHWoodwork'
    fill_in :url, with: 'www.mhwoodwork.co.uk'
    click_button 'Submit'

  expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content 'MHWoodwork'
    end
  end

end
