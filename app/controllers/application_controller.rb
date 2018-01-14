require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

#show all posts
  get '/posts' do
    @posts  = Post.all
    erb :index
  end

#show new post form
  get '/posts/new' do
    erb :new
  end

#create new post and redirect to /posts
  post '/posts' do
    # binding.pry
    @post = Post.create(name: params[:name], content: params[:content])
    redirect '/posts'
  end

#show one post by id
  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

#edit form
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

#show edited post
  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update(name: params[:name],content: params[:content])
    redirect "/posts/#{@post.id}"
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post_name = @post.name
    @post.destroy
    erb :delete
  end

end
