class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  def index
    @accounts = current_user.accounts
  end

  def show
  end

  def new
    @account = Account.new
  end

  def edit
  end

  def create
    @account = Account.new(account_params)
    @account.save
    redirect_to accounts_path
  end

  def update
    @account.update(account_params)
    redirect_to accounts_path
  end

  def destroy
    @account.destroy
    redirect_to accounts_path
  end

  def twitter_callback
    save_twitter_tokens
    flash[:success] = "Tu cuenta ha sido vinculada con twitter"
    redirect_to root_path
  end

  def save_facebook_token
      access_token = Koala::Facebook::OAuth.new(
        279720252237827,
        '5c087772fca552a7563a444a98262edb',
        facebook_callback_url
      ).get_access_token(params[:code])
      user = Koala::Facebook::API.new(access_token)
      @name = user.get_object('me')['name']
      current_user.accounts.create(key: 'fb-access-token', name: @name, value: access_token)

      flash[:success] = "Tu cuenta ha sido vinculada con Facebook"
      redirect_to root_path
  end

  private

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
