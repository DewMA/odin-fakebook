class LikesController < ApplicationController

    def create
        like = Like.new(post_id: params[:post_id], user_id: current_user.id)
        like.save
        redirect_to root_path
    end

    def destroy
        like = Like.find_by(post_id: params[:id], user_id: current_user.id)
        like.destroy
        redirect_to root_path
    end

end
