require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect "/posts"
  end

  get '/posts/new' do
    erb :new
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  post '/posts' do
    @post = Post.create(name: params[:name], content: params[:content])
    redirect "/posts"
  end

  get '/posts/:id/delete' do
    @post = Post.find(params[:id])
    erb :delete
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  delete '/posts/:id' do
    @post = Post.find(params[:id])
    @post.delete
    erb :delete
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update(name: params[:name], content: params[:content])
    redirect "/posts/#{@post.id}"
  end

  get '/posts/:id' do
    @post = Post.find_by(id: params[:id])
    erb :show
  end
end
