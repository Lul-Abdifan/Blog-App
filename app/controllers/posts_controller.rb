class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  
   
   end

  def show
    @post = Post.find(params[:id])
    @comments =@post.five_recent_comments
   end
end
