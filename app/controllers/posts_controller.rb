class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    logger.info params
    if params['Twitter'].present?
      twitter_publish_path(@post.value)
    end
  end

  def update
    @post.update(post_params)
  end


  def destroy
    @post.destroy
  end

  private
    def twitter_publish_path(text)
      get_twitter_token
      @twitter_client.update(text)
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:user_id, :value)
    end
end
