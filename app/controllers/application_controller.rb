require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  use Rack::Flash

helpers do
  def current_user
    @current_user ||= Speaker.find_by(id: session[:user_id]) if session[:user_id]
  end

  def is_logged_in?
    !!current_user
  end

  def slug(name)
    self.name.downcase.gsub(/[ ]/, "-")
  end

  def self.find_by_slug(name)
    self.all.detect do |object|
      object.slug(name) == name
    end
  end
end

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    !is_logged_in? ? (erb :index) : (redirect to '/speakers/show')
  end

  get '/login' do
    is_logged_in? ? (redirect to '/speakers/show') : (erb :'/speakers/login')
  end

  post '/login' do
    @user = Speaker.find_by(username: params["username"])
    if @user != nil && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/speakers/show"
    end
    erb :'/speakers/login'
  end

  get '/signup' do
    is_logged_in? ? (redirect to '/speakers/show') : (erb :'/speakers/create_speaker')
  end

  post '/signup' do
    if params[:username].empty? | params[:email].empty? | params[:password].empty?
      redirect to "/signup"
    end
    @user = Speaker.new(username: params[:username])
    @user.email = params[:email]
    @user.password = params[:password]
    @user.save
    session[:user_id] = @user.id
    redirect to "/speakers/show"
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end

end
