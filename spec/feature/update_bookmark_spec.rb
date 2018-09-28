feature 'Updating bookmarks' do
  scenario 'There are update buttons' do
    visit('/bookmarks')
    expect(page.status_code).to eq(200)
    page.should have_selector(:link_or_button, 'Update')
  end
  scenario 'User is directed to an update page when clicking on update' do
    visit('/bookmarks')
    expect(page.status_code).to eq(200)
    expect(page).to have_selector('input[id="update_1"]')
  end
  scenario 'User can update bookmark' do
    visit('/bookmarks')
    expect(page.status_code).to eq(200)
    click_button('update_2')
    fill_in('title', with: 'NewGoogle')
    fill_in('url', with: 'http://www.google.com')
    click_button('update')
    expect(page).to have_link('NewGoogle', href: 'http://www.google.com')
  end
end
