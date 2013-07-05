class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
    @rel = FollowUserRelationship.new
    @activities = PublicActivity::Activity
      .order("created_at desc")
      .select { |activity| activity.owner.id == @user.id }
	end
end
