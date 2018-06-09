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

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])

      erb :'/figures/edit'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])

    erb :'figures/show'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.name = params[:figure][:name]
    new_title = Title.create(params[:figure][:title_ids])
    @figure.title < new_title
    new_landmark = Landmark.create(params[:figure][:landmark_ids])
    @figure.landmark < new_landmark
    @figure.save
    binding.pry
    redirect "figure/#{@figure.id}"
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
