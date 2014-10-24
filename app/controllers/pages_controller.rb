class PagesController < ApplicationController
  def index
    @oauth = Koala::Facebook::OAuth.new(
      279720252237827, # app id
      '5c087772fca552a7563a444a98262edb', #app secret (don't steal 🙈)
      facebook_callback_url
    )
  end

  def save_facebook_token

  end
end
