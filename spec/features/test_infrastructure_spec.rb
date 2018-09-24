feature 'Testing infrastructure works' do
  scenario 'see Bookmark Manager on index page' do
    visit '/'
    expect(page).to have_content('Bookmark Manager')
  end
end
