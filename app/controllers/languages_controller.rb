class LanguagesController < ApplicationController

  get '/languages' do
    @languages = Language.all
    is_logged_in? ? (erb :'/languages/languages') : (redirect to '/')
  end

  get '/languages/new' do
    @languages = Language.all
    erb :'/languages/create_language'
  end

  post '/languages' do
    @language = Language.find_or_create_by(language_name: params[:language_name])
    erb :'/languages/show_language'
  end

  get '/languages/:slug' do
    if is_logged_in?
      @language = Language.find_by_slug(params[:slug])
      if @language
        erb :'/languages/show_language'
      else
        #FLASH MESSAGE: NOT CURRENTLY WORKING ON <%=LANGUAGE%> !
        redirect to '/'
      end
    else
      redirect to '/'
    end
  end




end
