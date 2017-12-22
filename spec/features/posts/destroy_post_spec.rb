feature 'Show Post', :devise do 
  scenario 'post can be destroyed by admin' do
    FactoryGirl.create(:user, email: 'test@example.com', password: 'please123').admin!
    post = FactoryGirl.create(:post, content: 'content')
    sign_in('test@example.com', 'please123')
    visit post_path(post)
    click_link 'Delete'
    expect(page).to have_content 'Successfully deleted post.'
  end

  scenario 'post cannot be destroyed by anyone but an admin' do
    FactoryGirl.create(:user, email: 'test@example.com', password: 'please123')
    post = FactoryGirl.create(:post, content: 'content')
    sign_in('test@example.com', 'please123')
    visit post_path(post)
    click_link 'Delete'
    expect(page).to have_content 'Access Denied.'
  end
end