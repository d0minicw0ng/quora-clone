class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications.order("created_at DESC")
    @notifications.each(&:mark_as_read)
  end
end
