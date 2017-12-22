feature 'Create Post', :devise do 
  scenario 'post can be created by a user' do
    FactoryGirl.create(:user, email: 'test@example.com', password: 'please123')
    sign_in('test@example.com', 'please123')
    visit new_post_path
    fill_in('post_content', with: 'content')
    click_button 'Create Post'
    expect(page).to have_content 'content'
  end

  scenario 'post cannot be created by a visitor' do
    visit new_post_path
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end