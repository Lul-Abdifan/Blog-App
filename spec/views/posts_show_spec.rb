require 'rails_helper'

RSpec.describe 'Integration Testin', type: :system do
    describe "Posts Index page" do

   before(:each) do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'Teacher from Mexico.')
    @post = Post.create(author: @user, title: 'Hello', text: 'This is my first post')
   Comment.create(author: @user, post: @post, text: 'this is my first comment')
    Comment.create(author: @user, post: @post, text: 'this is my 2nd comment')
    visit user_post_path(@user,@post)

    end
   
    it "the post's title" do
        expect(page).to have_content(@post.title)
    end

    it "who wrote the post" do
                  expect(page).to have_content(@post.author.name)
    end

    it "how many comments it has" do
               expect(page).to have_content(@post.comments_counter)
        end

        it "how many likes it has" do
            expect(page).to have_content(@post.likes_counter)
     end

     it "see the post body" do
                expect(page).to have_content(@post.text)
   end


it "username of each commentor" do
           expect(page).to have_content(@post.comments[0].author.name)
end
    
it "comment each commentor left" do
    expect(page).to have_content(@post.comments[0].text)
end
end
end