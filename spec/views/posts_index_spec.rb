require 'rails_helper'

RSpec.describe 'Integration Testin', type: :system do
    describe "Posts Index page" do

   before(:each) do

    end
   it "user's profile picture" do
     end

     it "user's username" do
    expect(page).to have_content(@user1.name)
    end

    it "User Profile Picture" do
        expect(page).to have_css("img[src='#{@user1.photo}']")
       end

       it "number of posts" do 

              expect(page).to have_content(@user1.posts_counter)
       end

       it ' posts title' do
  
          expect(page).to have_content(@post1.text)
       end

       it 'shows posts body.' do
         expect(page).to have_content(@post1.text)
      end

      it "first comments on a post " do
          expect(page).to have_content(@user1.posts[0].comments[0])
      end

      it " how many comments a post has." do
          expect(page).to have_content(@user1.posts[0].comments_counter)
      end

      it " how many likes a post has" do
          expect(page).to have_content(@user1.posts[0].likes_counter)
      end

      it "section for pagination" do
              expect(page).to have_link('Pagination', class: 'pagination')
      end

      it "click on a post, it redirects me to that post's show page" do
    
        click_link(@post1.text)
        expect(page).to have_current_path(user_post_path(@user1, @post1))
      end
       

    end
end