class PostsController < ApplicationController
  load_and_authorize_resource
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

  def destroy
    @post = Post.find(params[:id])
    @post.likes.destroy_all
    @post.comments.destroy_all
    if @post.destroy
      redirect_to user_posts_url(current_user), notice: 'Post is successfully deleted.'
    else
      flash[:notice] = "Post isn't successfully deleted."
    end
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
