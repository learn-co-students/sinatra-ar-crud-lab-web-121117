require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  # INDEX ACTION
  get '/posts' do
    @posts = Post.all
    erb :index
  end

  #NEW ACTION - Show Form
  get "/posts/new" do
    erb :new
  end

  #CREATE ACTION (ALWAYS THROW A PRY)
  post '/posts' do
    @post = Post.create(params[:post])
    redirect '/posts'
  end

  #EDIT ACTION
  get "/posts/:id/edit" do
    @post = Post.find(params[:id])
    erb :edit
  end

  #SHOW ACTION
  get "/posts/:id" do
    @post = Post.find(params[:id])
    erb :show
  end

  #UPDATE ACTION
  patch "/posts/:id" do
    @post = Post.find(params[:id])
    @post.update(params[:post])
    redirect "/posts/#{@post.id}"
  end

  #DELETE ACTION
  delete "/posts/:id/delete" do
    @post = Post.find(params[:id])
    @post_name = @post.name
    Post.destroy(params[:id])
    "#{@post_name} has been deleted."
    # erb :deleted_method
  end

  #DELETE ACTION
  # delete "posts/:id" do
  #   @post = Post.find(params[:id])
  #   @post.destroy
  #   redirect "/posts"
  # end






end
