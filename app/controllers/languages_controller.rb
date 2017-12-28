class LanguagesController < ApplicationController

  get '/languages' do

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
