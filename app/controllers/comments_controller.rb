class CommentsController < ApplicationController

    def new
        @comment = Comment.new
        @post = Post.find(params[:post_id])
    end

    def create
        @comment = Comment.new(get_params)
        @post = Post.find(params[:post_id])
        @comment.post = @post
        @comment.user = current_user
        if @comment.save
            redirect_to root_path
        else
            render :new
        end
    end

    private

    def get_params
        params.require(:comment).permit(:body)
    end

end
