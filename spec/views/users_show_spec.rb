require 'rails_helper'

RSpec.describe 'Integration Testin', type: :system do
    describe "Users index page" do
        before(:each) do
            @user1 = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                bio: 'Teacher from Mexico.')
           @post = Post.create(author: @user1, title: 'Hello', text: 'This is my first post')
            Post.create(author: @user1, title: 'yup', text: 'This is my second post')
            Post.create(author: @user1, title: 'Bye', text: 'This is my third post')
            end
               it "User Profile Picture" do
                  visit user_path(@user1)
                expect(page).to have_css("img[src='#{@user1.photo}']")
               end

               it "Check the user's username" do
                visit user_path(@user1)
                expect(page).to have_content(@user1.name)
               end

               it "Number of posts the user" do
                visit user_path(@user1)
                expect(page).to have_content(@user1.posts_counter)
               end

               it "User's Bio" do
                visit user_path(@user1)
                expect(page).to have_content(@user1.bio)
               end

               it "Three recent posts" do
                visit user_path(@user1)
                  expect(@user1.recent_posts.length).to eq 3
               end

               it "has a link to the user's posts page" do
                  visit user_path(@user1)
                          expect(page).to have_link('See all Posts', href: user_posts_path(@user1), class: 'all_post_btn')
              end

              it "click a user's post, it redirects to that post's show page" do
                   visit user_path(@user1)
                 click_link('See all Posts')
                     expect(page).to have_current_path(user_posts_path(@user1))
            end

            it "redirects to the user's post's index page" do
                visit user_path(@user1)
                click_link('See all Posts')
                click_link(@post.title)
                 expect(page).to have_current_path(user_post_path(@user1, @post))
            end
               
    end
end