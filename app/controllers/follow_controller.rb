class FollowController < ApplicationController
	before_action :authenticate_user!

    def create
        @user = User.find(params[:user_id])
        follow = current_user.follows.build(following_id: @user.id)
        if follow.save
            redirect_to posts_url, notice: "フォローしました"
        else
            redirect_to posts_url, alert: "フォローできません"
        end
    end

    def destroy
        @user = User.find(params[:user_id])
        follow = current_user.follows.find_by!(following_id: @user.id)
        follow.destroy
        redirect_to posts_url, notice: "フォロー解除しました"
    end
end
