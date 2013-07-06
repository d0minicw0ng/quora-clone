class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications.order("created_at DESC")
  end
end
