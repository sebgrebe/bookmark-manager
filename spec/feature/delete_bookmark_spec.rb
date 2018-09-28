feature 'Deleting bookmarks' do
  scenario 'User can delete a bookmark' do
    visit('/bookmarks')
    expect(page.status_code).to eq(200)
    expect(page).to have_content 'Delete'
  end
end
