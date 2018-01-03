require 'rack-flash'

class SpeakersController < ApplicationController
  use Rack::Flash

  get '/speakers' do
    if is_logged_in?
      @users = Speaker.all
      erb :'/speakers/speakers'
    else
      flash[:message] = "Please log in before you attempt to view speakers page."
      redirect to '/'
    end
  end

  get '/speakers/show' do
    if is_logged_in?
      @user = Speaker.find(session[:user_id])
      erb :'/speakers/show_speaker'
    else
      flash[:message] = "User must log in before viewing user page."
      redirect to '/'
    end
  end

  get '/speakers/:id/edit' do
    if is_logged_in?
      @user = Speaker.find(session[:user_id])
      if params[:id].to_i == session[:user_id]
        erb :'/speakers/edit_speaker'
      else
        # FLASH MESSAGE "CANNOT EDIT ANOTHER USERS INFORMATION!"
        redirect to '/'
      end
    else
      redirect to '/'
    end
  end

end
