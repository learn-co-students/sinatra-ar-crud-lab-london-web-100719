
require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  resource='/articles'

  get '/' do
    redirect to '/articles'
  end

  #INDEX
  get '/articles' do
    @articles = Article.all
    erb :index
  end
  

  # CREATE

  # new
  get '/articles/new' do
    @article = Article.new
    erb :new
  end

  # create
  post '/articles' do
    @article = Article.create(params)
    redirect "/articles/#{ @article.id }"
  end

  # SHOW
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  # UPDATE

  # edit
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  # update
  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect "/articles/#{@article.id}"
  end


  delete "/articles/:id" do
    Article.destroy(params[:id])
    redirect to "/articles"
  end

end