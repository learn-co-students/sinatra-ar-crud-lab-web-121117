require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @post = Post.create(name: params[:name], content: params[:content])
    erb :index
  end

  patch '/posts/:id' do
    @found = Post.find(params[:id])
    @post = @found.update(name: params[:name],content: params[:content])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  delete '/posts/:id/delete' do
    @post_name = Post.find(params[:id]).name
    Post.destroy(params[:id])
    "#{@post_name} was deleted"
  end

end
