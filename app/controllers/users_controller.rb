class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
    @rel = FollowUserRelationship.new
    @activities = PublicActivity::Activity
      .where("owner_id = ?", @user.id)
      .order("created_at DESC")
      .paginate(:page => params[:page], :per_page => 10)
	end
end
