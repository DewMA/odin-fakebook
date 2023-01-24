class PostsController < ApplicationController
    before_action :authenticate_user!

    def index
        @posts = Post.all
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
        params.require(:post).permit(:title, :body)
    end

end
