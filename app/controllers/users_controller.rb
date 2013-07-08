class UsersController < ApplicationController
  def index
    @users = User.all
    render :json => @users
  end

	def show
		@user = User.find(params[:id])
    @rel = FollowUserRelationship.new
    @activities = PublicActivity::Activity
      .where("owner_id = ? AND owner_type = ?", @user.id, "User")
      .order("created_at DESC")

    render :show => @user
	end
end
