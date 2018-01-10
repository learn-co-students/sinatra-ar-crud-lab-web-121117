require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @post = Post.create(params)
    redirect "/posts"
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update(params[:post])
    redirect "/posts/#{@post.id}"
  end

  get '/posts/:id/delete' do
    @post = Post.find(params[:id])
    erb :delete
  end

  delete "/posts/:id" do
    @post = Post.find(params[:id])
    @post_name = @post.name
    @post.destroy
    erb :delete
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/' do
    "welcome!"
  end

end
