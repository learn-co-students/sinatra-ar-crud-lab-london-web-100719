
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  get '/articles' do
    erb :index
  end

  post '/articles' do
    @new_article = Article.create(title: params[:title], content: params[:content])
    redirect "/articles/#{@new_article.id}"
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    Article.update(params[:id], title: params[:title], content: params[:content])
    redirect "/articles/#{@article.id}"
  end

  delete '/articles/:id' do
    Article.destroy(params[:id])
  end


end
