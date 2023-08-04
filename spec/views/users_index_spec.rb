require 'rails_helper'

RSpec.describe 'Integration Testin', type: :system do
    describe "Users index page" do
      before(:each) do
        @user1 = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
            bio: 'Teacher from Mexico.')
        @user2 = User.create(name: 'Abdi', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                bio: 'Teacher from Mexico.')
                visit "/users"
      end
      it "Seeing Username of users" do
        expect(page).to have_content(@user1.name)
        expect(page).to have_content(@user2.name)
      end

      
      it "Display Users photo" do
                expect(page).to have_css("img[src='#{@user1.photo}']")
                expect(page).to have_css("img[src='#{@user2.photo}']")
    end


      it "Number of post for users" do
        expect(page).to have_content(@user1.posts_counter)
        expect(page).to have_content(@user2.posts_counter)
      end

      it "Clicking the user redirects to its show page" do
        click_link "#{@user1.name}"
         expect(page).to have_content(@user1.bio)
       end
      end
   
end