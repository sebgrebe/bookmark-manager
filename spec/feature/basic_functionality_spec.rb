
feature 'Homepage' do
  scenario 'homepage greets user' do
    visit '/'
    expect(page).to have_content("Hello world")
  end
end
