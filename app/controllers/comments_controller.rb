class CommentsController < ApplicationController
  load_and_authorize_resource
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]

    if @comment.save
      flash[:success] = 'New comment successfully added!'
         redirect_to user_post_path(params[:user_id], params[:post_id])
    else
      render :new
      flash[:notice] = 'Fill again'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
     @post = Post.find(params[:post_id])
                                              @user = User.find(params[:user_id])
   flash[:success] = if @comment.destroy
                        'Successfully deleted'
                      else
                        'Post deletion failed'
                      end
    redirect_to user_post_url(@user, @post)
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
