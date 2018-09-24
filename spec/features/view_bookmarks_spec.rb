feature 'Viewing Bookmarks' do
  scenario 'see a bookmark title' do
    visit '/bookmarks'
    expect(page).to have_content('Makers')
  end
  scenario 'see a bookmark description' do
    visit '/bookmarks'
    expect(page).to have_content('makers description')
  end
  scenario 'see a bookmark url' do
    visit '/bookmarks'
    expect(page).to have_link('Makers')
  end
end
