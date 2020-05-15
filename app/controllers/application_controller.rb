
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/' do
    redirect to '/articles'
  end

  # index / READ
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  # new / CREATE
  get "/articles/new" do
    @article = Article.new
    erb :new
  end

  # create / CREATE
  post "/articles" do
    @article = Article.create(params)
    redirect to "/articles/#{ @article.id }"
  end

  # show / READ
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  # edit / UPDATE
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  # update / UPDATE
  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{params[:id]}"
  end

  # destroy / DELETE
  delete '/articles/:id' do
    Article.destroy(params[:id])
    redirect to '/articles'
  end
end
