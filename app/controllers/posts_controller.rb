class PostsController < ApplicationController
  
  
  def index
    @post = Post.new
    @posts = Post.all
  end
  
  def destroy
    @post = Post.find(params[:id])
    if current_user == @post.user
      @post.destroy
    end
    redirect_to newsfeed_url
  end

  
  def create
    @post = current_user.posts.create(post_params)
  
    
    if params[:id]
      @post.receiver_id = params[:id].to_i
      @post.save
      redirect_to user_path(params[:id])
    else
      @post.save
      redirect_to newsfeed_url
    end
  end
  
  private
  
    def post_params
      params.require('post').permit('message', 'image')
    end
    
end