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
    @landmarks = params[:figure][:landmark_ids]
    @titles = params[:figure][:title_ids]
     if @landmarks
       @landmarks.each do
      @figure.landmarks <<  Landmark.find(l_id)
    end
    if @titles
      @titles.each do |l_id|
        @figure.titles <<  Title.find(l_id)
    end
  end

  end



end
