
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

    configure do

        set :public_folder, 'public'
        set :views, 'app/views'

    end

    get '/' do

        redirect to "/articles"
        
    end

    get '/articles/new' do

        erb :new
        
    end

    get '/articles' do

        @articles = Article.all

        erb :index
        
    end

    get '/articles/:id' do

        @article = Article.find_by id: params[:id]

        erb :show
        
    end

    patch '/articles/:id' do

        @article = Article.find_by id: params[:id]
        @article.title = params[:title]
        @article.content = params[:content]
        @article.save

        erb :show
        
    end

    get '/articles/:id/edit' do

        @article = Article.find_by(id: params[:id])

        erb :edit
        
    end

    post '/articles' do

        @article = Article.create(params)

        redirect to "/articles/#{ @article.id }"
        
    end

    delete '/articles/:id' do

        Article.find_by(id: params[:id]).destroy

        redirect to "/articles"
        
    end
    
end
