class SpeakersController < ApplicationController

  get '/speakers' do
    if is_logged_in?
      @users = Speaker.all
      erb :'/speakers/speakers'
    else
      redirect to '/'
    end
  end

  get '/speakers/show' do
    if is_logged_in?
      @user = Speaker.find(session[:user_id])
      erb :'/speakers/show_speaker'
    else
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
