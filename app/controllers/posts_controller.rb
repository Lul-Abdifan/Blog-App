class PostsController < ApplicationController
  def index
    @user = User.includes(posts: [:comments]).find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.five_recent_comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id

    if @post.save
      flash[:success] = 'New post successfully added!'
      redirect_to user_post_path(current_user, @post)
    else
      render :new
      flash[:notice] = 'Fill again'
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
