feature 'Show Post', :devise do 
  scenario 'post can be viewed by any user' do
    FactoryGirl.create(:user, email: 'test@example.com', password: 'please123')
    post = FactoryGirl.create(:post, content: 'content')
    sign_in('test@example.com', 'please123')
    visit post_path(post)
    expect(page).to have_content 'content'
  end

  scenario 'post cannot be viewed by a visitor' do
    post = FactoryGirl.create(:post, content: 'content')
    visit post_path(post)
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end