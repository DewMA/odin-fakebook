class FriendsController < ApplicationController

    def requests
        @friends = current_user.friend_requests
        render :index
    end

    def index
        @friends = current_user.friends
    end

    def create
        friend = Friend.new(requester_id: current_user.id, reciever_id: params[:id], status: 1)
        friend.save
        @user = User.find(params[:id])
    end

    def update
        friend = get_friend
        friend.update(status: 0)
        @user = User.find(params[:id])
    end

    def destroy
        friend = get_friend
        friend.destroy
        @user = User.find(params[:id])
    end

    private

    def get_friend
        Friend.find_by(requester_id: params[:id], reciever_id: current_user.id) || Friend.find_by(requester_id: current_user.id, reciever_id: params[:id])
    end

end
