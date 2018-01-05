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
        flash[:message] = "Cannot edit other users' pages."
        redirect to '/'
      end
    else
      redirect to '/'
    end
  end

  patch '/speakers/:id' do
    @user = Speaker.find(session[:user_id])
    if @user.languages.include?(Language.find_by(language_name: params[:language_name]))
      flash[:message] = "Already learning language. Please select another."
      redirect to "/speakers/#{@user.id}/edit"
    end
    @user.languages << Language.find_by(language_name: params[:language_name])
    @user.save
    redirect to '/speakers/show'
  end

end
