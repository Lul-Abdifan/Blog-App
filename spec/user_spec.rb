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
end