class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def get_twitter_token
    @twitter_token = current_user.accounts.where(key: 'twitter-token').first
    @twitter_secret = current_user.accounts.where(key: 'twitter-secret').first

    if !@twitter_token.nil? && !@twitter_secret.nil?
      @twitter_client ||= ::Twitter::REST::Client.new do |config|
        # don't steal please :D
        config.consumer_key        = 'JmaekFCAUu6jkYoVPsSSoTBGD'
        config.consumer_secret     = '0MQbTPOgPpLwu5ymkatJwvz1ddvPF0AHhqJTnnlfjsLrdARA4Q'
        config.access_token        = @twitter_token.value
        config.access_token_secret = @twitter_secret.value
      end
      @twitter_user = @twitter_client.user
    end
  end

  def get_facebook_token
    @fb_access_token = current_user.accounts.where(key: 'fb-access-token').first

    if !@fb_access_token.nil?
      @graph = Koala::Facebook::API.new(@fb_access_token.value)
      @fb_user = @graph.get_object("me")
    end
  end
end
