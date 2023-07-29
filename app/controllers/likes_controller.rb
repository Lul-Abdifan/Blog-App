class LikesController < ApplicationController
   def create
        @like = Like.new
        @like.author_id =current_user.id
        @like.post_id = params[:post_id]
        if @like.save
            flash[:success] = 'Your like is saved!'
            redirect_to(request.referer)
        end
    end

end
