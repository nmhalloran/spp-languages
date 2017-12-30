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

  get '/languages/show' do

  end




end
