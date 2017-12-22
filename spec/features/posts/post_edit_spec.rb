feature 'Edit Post', :devise do 
  scenario 'posts can be edited by their creator' do
    user = FactoryGirl.create(:user, email: 'test@example.com', password: 'please123')
    sign_in('test@example.com', 'please123')
    post = FactoryGirl.create(:post, content: 'content')
    post.user = user
    post.save
    visit edit_post_path(post)
    fill_in('post_content', with: 'edited content')
    click_button 'Update Post'
    expect(page).to have_content 'edited content'
    expect(Post.last.content) == 'edited content'
  end

  scenario 'any post can be edited by vip' do
    FactoryGirl.create(:user, email: 'test@example.com', password: 'please123').vip!
    sign_in('test@example.com', 'please123')
    post = FactoryGirl.create(:post, content: 'content')
    visit edit_post_path(post)
    fill_in('post_content', with: 'edited content')
    click_button 'Update Post'
    expect(page).to have_content 'edited content'
    expect(Post.last.content) == 'edited content'
  end

  scenario 'any post can be edited by admin' do
    FactoryGirl.create(:user, email: 'test@example.com', password: 'please123').admin!
    sign_in('test@example.com', 'please123')
    post = FactoryGirl.create(:post, content: 'content')
    visit edit_post_path(post)
    fill_in('post_content', with: 'edited content')
    click_button 'Update Post'
    expect(page).to have_content 'edited content'
    expect(Post.last.content) == 'edited content'
  end
end