require 'rails_helper'

describe Post do
  it 'belongs to a user' do
    expect(Post.new).to respond_to(:user)
  end

  it 'can add content' do
    post = Post.create(content: "This is test content")
    expect(post.content).to eq("This is test content")
  end
end
