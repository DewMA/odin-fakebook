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
        if !@comment.save
            render :new
        end
    end

    def edit
        @comment = Comment.find(params[:id])
    end

    def update
        @comment = Comment.find(params[:id])
        if !@comment.update(get_params)
            render :edit
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
    end

    private

    def get_params
        params.require(:comment).permit(:body)
    end

end
