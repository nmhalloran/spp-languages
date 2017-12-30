class SpeakersController < ApplicationController

  get '/speakers/show' do
    if is_logged_in?
      @user = Speaker.find(session[:user_id])
      erb :'/speakers/show_speaker'
    else
      redirect to '/'
    end
  end

end
