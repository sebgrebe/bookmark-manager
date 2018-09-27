describe 'Features' do
  feature 'Adding bookmarks' do
    scenario 'user is send to create page on clicking add' do
      visit('/bookmarks')
      click_button('Add')
      expect(page.status_code).to eq(200)
      expect(page).to have_content 'Add title and url here:'
    end
    scenario 'a user adds a title' do
      visit('/create')
      expect(page.status_code).to eq(200)
      fill_in('URL', with: 'http://www.testbookmark.com')
      fill_in('title', with: 'Testbookmark')
      click_button('Submit')
      expect(page).to have_content 'Testbookmark'
    end
    scenario 'a user adds a url' do
      visit('/create')
      expect(page.status_code).to eq(200)
      fill_in('URL', with: 'http://www.testbookmark.com')
      fill_in('title', with: 'Testbookmark')
      click_button('Submit')
      expect(page).to have_link(nil, href: 'http://www.testbookmark.com')
    end
    scenario 'a user tries to add an invalid url and sees an error message' do
      visit('/create')
      expect(page.status_code).to eq(200)
      fill_in('URL', with: 'something invalid')
      click_button('Submit')
      expect(page).to have_content 'This is not a valid URL'
    end
     scenario 'a user will not see an invalid url they tried to add in their bookmarks' do
      visit('/create')
      expect(page.status_code).to eq(200)
      fill_in('URL', with: 'something invalid')
      click_button('Submit')
      expect(page).not_to have_content 'something invalid'
    end
  end
end
