class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
    @rel = FollowUserRelationship.new
	end
end
