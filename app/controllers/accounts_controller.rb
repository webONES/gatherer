class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  def index
    @accounts = current_user.accounts
    # respond_with(@accounts)
  end

  def show
    # respond_with(@account)
  end

  def new
    @account = Account.new
    # respond_with(@account)
  end

  def edit
  end

  def create
    @account = Account.new(account_params)
    @account.save
    # respond_with(@account)
  end

  def update
    @account.update(account_params)
    # respond_with(@account)
  end

  def destroy
    @account.destroy
    # respond_with(@account)
  end

  def twitter_callback
      save_twitter_tokens
      flash[:success] = I18n.t('twitter.saved_token')
      redirect_to root_path
    end

    # def instagram_login
    #   redirect_to Instagram.authorize_url(:redirect_uri => instagram_callback_sessions_url, :scope => 'comments')
    # end
    #
    # def instagram_callback
    #   response = Instagram.get_access_token(params[:code], :redirect_uri => instagram_callback_sessions_url)
    #   username = Instagram.client(access_token: response.access_token).user.username
    #   Auth.create(key: 'instagram', value: response.access_token, name: "@#{username}")
    #   redirect_to instagram_analytics_path
    # end


  private
    # def configure_instagram
    #   Instagram.configure do |config|
    #     config.client_id = Adminpanel.instagram_client_id
    #     config.client_secret = Adminpanel.instagram_client_secret
    #   end
    # end

    def save_twitter_tokens
      twitter_user = "@#{request.env['omniauth.auth']['info']['nickname']}"
      ['token', 'secret'].each do |key|
        Account.create(
          user_id: current_user.id,
          key: "twitter-#{key}",
          name: twitter_user,
          value: request.env['omniauth.auth']['credentials'][key]
        )
      end
    end

    def set_account
      @account = Account.find(params[:id])
    end

    def account_params
      params.require(:account).permit(
        :user_id,
        :name,
        :value,
        :key
      )
    end
end
