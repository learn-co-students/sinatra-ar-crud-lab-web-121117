require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end
  get '/posts' do
    @posts = Post.all
    erb :'index'
  end
  get '/posts/new' do
    erb :'new'
  end
  post '/posts' do
    @new_post = Post.create({name: params[:name], content: params[:content]})
    redirect '/posts'
  end
  get '/posts/:id/delete' do
    @post = Post.find(params[:id])
    erb :'delete'
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :'edit'
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update(params[:post])
    redirect "/posts/#{@post.id}"
  end

  delete '/posts/:id' do
    @post = Post.find(params[:id])
    @post_name = @post.name
    @post.destroy
    erb :'delete'
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :'show'
  end

end
