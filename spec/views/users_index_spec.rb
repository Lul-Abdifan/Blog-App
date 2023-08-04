require 'rails_helper'

RSpec.describe 'Hello world', type: :system do
    describe "Users index page" do
      before(:each) do
        @user1 = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
            bio: 'Teacher from Mexico.')
        @user2 = User.create(name: 'Abdi', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                bio: 'Teacher from Mexico.')
      end
      it "Seeing Username of users" do
        visit "/users"
        expect(page).to have_content(@user1.name)
      end

      
      it "Display Users photo" do
        visit "/users"
        all('.custom-list-item').each_with_index do |list_item, index|
          user = instance_variable_get("@user#{index + 1}")
          expect(list_item).to have_css("img[src='#{user.photo}']")
      end
    end


      it "Number of post for users" do
        visit "/users"
        expect(page).to have_content(@user1.posts_counter)
      end

      it "Clicking the user redirects to its show page" do
        visit "/users"
        click_link "#{@user1.name}"

             expect(page).to have_content(@user1.bio)

      end
      end
   
end