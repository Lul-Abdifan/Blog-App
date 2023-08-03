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

      end
   
end