require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

#  -what is this?  this isnt index? -homepage?
  get '/' do
    # erb :index
  end

#new
  get '/posts/new' do
    erb :new
  end

#create
  post '/posts' do
    # binding.pry
    @post = Post.create(params[:post])
    # binding.pry
    redirect '/posts'
  end

#index
  get '/posts' do
    @posts = Post.all
    erb :index
  end

#show
  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

#edits
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

#update
  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update(params[:post])
    redirect "/posts/#{@post.id}"
  end

#delete
  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.destroy
    redirect '/posts'
  end

end
