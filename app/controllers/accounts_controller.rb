class AccountsController < ApplicationController
  def index
    @accounts = Account.all
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    @account.save
    redirect_to account_path(@account)
  end

  def show
    @account = Account.find(params[:id])
    @account_posts = @account.posts
  end

  private

  def account_params
    params.require(:account).permit(:name)
  end

end
