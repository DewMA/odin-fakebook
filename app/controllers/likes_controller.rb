class LikesController < ApplicationController

    def create
        @post = Post.find(params[:post_id])
        @limit = '2'
        like = Like.new(post_id: params[:post_id], user_id: current_user.id)
        like.save
    end

    def destroy
        like = Like.find_by(post_id: params[:id], user_id: current_user.id)
        like.destroy
        @post = Post.find(params[:id])
        @limit = '2'
        render :create
    end

end
