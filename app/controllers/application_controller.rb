require_relative '../../config/environment'
require_relative '../models/post.rb'

# pry.start

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts' do
    # binding.pry
    @posts = Post.all
    erb :'/posts/index'
  end

  get '/posts/new' do
    erb :'/posts/new'
  end

  post '/posts' do
    Post.create(name: params[:name], content: params[:content])
    redirect :"/posts"
  end

  # post '/posts/:id' do
  #   binding.pry
  # end

  get '/posts/:id/edit' do
    # binding.pry
    @post = Post.find(params[:id])
    erb :"/posts/edit"
  end

  patch '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    # binding.pry
    @post[:name] = params[:name]
    @post[:content] = params[:content]
    @post.save
    # binding.pry
    redirect to "/posts/#{@post.id}"
  end

  # get '/delete' do
  #   erb :"/posts/delete"
  # end

  delete '/posts/:id' do
    # binding.pry
    @post = Post.find_by_id(params[:id])
    Post.delete(@post)
    @posts = Post.all
    erb :'/posts/delete'
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :"/posts/show"
  end



end
