class WordsController < ApplicationController
  get "words/:slug/learn_word" do
    if is_logged_in?
      @user = Speaker.find(session[:user_id])
      @language = Language.find_by_slug(params[:slug])
      erb :'/words/add_word'
    else
      redirect to '/'
    end

  end


end
