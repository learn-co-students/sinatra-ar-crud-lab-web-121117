class PostsController < ApplicationController
  
  # index - show all
  get '/posts' do
    @posts = Post.all
    erb :'posts/index'
  end
  
  # new - show form to add post
  get '/posts/new' do
    erb :'posts/new'
  end
  
  # show 1 post
  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :'posts/show'
  end
  
  # create - create post from form
  post '/posts' do
    # binding.pry
    @post = Post.create(name: params[:name], content: params[:content])
    redirect "posts"
  end

  # edit - shows edit form
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :'/posts/edit'
  end
  
  # update
  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update(name: params[:name], content: params[:content])
    # params[:artist] above here
    redirect "/posts/#{@post.id}"
  end

  # delete
  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post_name = @post.name
    @post.destroy
    erb :'/posts/delete'
  end
end
