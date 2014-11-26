class PagesController < ApplicationController
  before_action :get_twitter_token, only: [:index, :twitter]
  before_action :get_facebook_token, only: [:index]

  def index
    @fb_oauth = Koala::Facebook::OAuth.new(
      279720252237827, # app id
      '5c087772fca552a7563a444a98262edb', #app secret (don't steal 🙈)
      facebook_callback_url
    )
    @post = Post.new
    @feed = Post.all.limit(10)
  end

  def gatherer
    @posts = Post.all.limit(25)
  end

  def twitter
    
    @posts = @twitter_client.home_timeline.take(10)
    #18 publicaciones obtener el cliente de twitter para obtener el cliente del token
  end
end
