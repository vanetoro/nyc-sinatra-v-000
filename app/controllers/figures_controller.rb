class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all

    erb :'figures/index'
  end
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    # binding.pry
    erb :'figures/show/'
  end

  post '/figures' do
    @figure = Figure.create(name: params[:figure][:name])
    @landmarks = params[:figure][:landmark_ids]
    @titles = params[:figure][:title_ids]
    @new_title = params[:title][:name]
    @new_landmark = params[:landmark][:name]
      if @landmarks
         @landmarks.each do |l_id|
           @figure.landmarks <<  Landmark.find(l_id)
        end
      end
    if @titles
      @titles.each do |t_id|
        @figure.titles <<  Title.find(t_id)
      end
    end
    if !@new_title.empty?
      @title = Title.create(name: @new_title)
      @figure.titles << @title
    end
    if !@new_landmark.empty?
      @landmark = Landmark.create(name: @new_landmark)
      @figure.landmarks << @landmark
    end
    @figure.save
    redirect "figures/#{@figure.id}"
  end

end