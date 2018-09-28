feature 'Deleting bookmarks' do
  scenario 'There are delete buttons' do
    visit('/bookmarks')
    expect(page.status_code).to eq(200)
    page.should have_selector(:link_or_button, 'Delete')
  end
  scenario 'User can delete a bookmark' do
    # visit('/bookmarks')
    # expect(page.status_code).to eq(200)
    # click_button('delete_1')
    # expect(page).to_not have_link('Makers', href: 'http://www.makersacademy.com')
  end
end
