class FiguresController < ApplicationController

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  get '/figures' do
    @figures = Figure.all

    erb :'/figures/index'
  end

  post '/figures' do
    @figure = Figure.new(params[:figure])

    if params[:landmark][:name] != ""
      @landmark = Landmark.new(params[:landmark])
      @figure.landmarks << @landmark
    end

    if params[:title][:name] != ""
      @title = Title.new(params[:title])
      @figure.titles << @title
    end

    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])

    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @titles = Title.all
    @landmarks = Landmark.all
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])

    if params[:landmark][:name] != ""
      @landmark = Landmark.new(params[:landmark])
      @figure.landmarks << @landmark
    end

    if params[:title][:name] != ""
      @title = Title.new(params[:title])
      @figure.titles << @title
    end

    redirect to "/figures/#{@figure.id}"
  end


end
