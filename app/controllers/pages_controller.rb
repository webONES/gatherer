class PagesController < ApplicationController
  before_action :get_twitter_token, only: [:index]

  def index
    @fb_oauth = Koala::Facebook::OAuth.new(
      279720252237827, # app id
      '5c087772fca552a7563a444a98262edb', #app secret (don't steal 🙈)
      facebook_callback_url
    )
    @post = Post.new
  end

  def save_facebook_token

  end
end
