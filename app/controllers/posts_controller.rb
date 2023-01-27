class PostsController < ApplicationController
    before_action :authenticate_user!

    def load_comments
        @post = Post.find(params[:post_id])
        @limit = @post.comment.size
    end

    def index
        @posts = Post.get_latest
        @limit = '2'
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(get_params)
        @post.user_id = current_user.id
        if @post.save
            redirect_to root_path
        else
            render :new
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(get_params)
            redirect_to root_path
        else
            render :edit
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
    end

    private

    def get_params
        params.require(:post).permit( :body, :image)
    end

end
