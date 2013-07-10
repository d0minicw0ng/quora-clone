class ApplicationController < ActionController::Base
  protect_from_forgery
	before_filter :authenticate_user!
  helper_method :broadcast_server

  include PublicActivity::StoreController

  def broadcast_server
    if request.port.to_i != 80
      "http://dominic-wong-faye-server.herokuapp.com:80/faye"
    else
      "http://dominic-wong-faye-server.herokuapp.com/faye"
    end
  end
end
