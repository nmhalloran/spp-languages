require './config/environment'

class ApplicationController < Sinatra::Base

helpers do
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def is_logged_in?
    !!current_user
  end
end

  def slug
    self.username.downcase.gsub(/[ ]/, "-")
  end
  
  def self.find_by_slug(name)
    self.all.detect do |object|
      object.slug == name
    end
  end

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions unless test?
    set :session_secret, "secret"
  end

end
