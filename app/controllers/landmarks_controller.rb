class LandmarksController < ApplicationController

    get '/' do
      @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do

    erb :'/landmarks/new'
  end

  get 'landmarks/:slug/edit' do

  end

  get '/landmarks/:slug' do

    erb :'/landmarks/show'

  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])

    erb :'/landmarks'
  end

end
