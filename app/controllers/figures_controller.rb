class FiguresController < ApplicationController

  get '/' do
    @figures = Figure.all

    erb :'figures/index'
  end
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  post '/figures' do

    @figure = Figure.create(name: params[:figure][:name])
    params[:figure][:landmark_ids].each do |l_id|
      @figure.landmarks <<  Landmark.find(l_id)
    end

    params[:figure][:title_ids].each do |l_id|
      @figure.titles <<  Title.find(l_id)
    end
    binding.pry
  end
end
