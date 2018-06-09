class LandmarksController < ApplicationController

    get '/landmarks' do
      @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do

    erb :'/landmarks/new'
  end

  get 'landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])


    erb :"/landmark/edit"
  end

  get '/landmarks/:id' do
      @landmark = Landmark.find(params[:id])

    erb :'/landmarks/show'

  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    # binding.pry
    erb :'/landmarks'
  end

end
