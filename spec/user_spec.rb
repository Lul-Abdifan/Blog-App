require 'rails_helper'

RSpec.describe User, type: :model do

    subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
    before { subject.save }

       it 'Name should be present' do
        subject.name = nil
        expect(subject).not_to be_valid
       end

       it 'User posts cannot be negative ' do
        subject.posts_counter = -1;
        expect(subject).not_to be_valid
       end


    it 'Validation without a valid name' do
        user = User.new(photo:"abdi_photo.jpeg",bio:"I am just nobody")
         expect(user).not_to be_valid
    end

    it "returns up to 3 recent posts" do
        first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                                 bio: 'Teacher from Mexico.')
        recent_posts = first_user.recent_posts
  
        # Expecting the length of recent_posts to be 0 since no posts have been created yet
        expect(recent_posts.length).to eq(0)
  
        Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
        Post.create(author: first_user, title: 'Hello', text: 'This is my second post')
        Post.create(author: first_user, title: 'Hello', text: 'This is my third post')
  
       
        expect(first_user.recent_posts.length).to eq(3)
        end
end