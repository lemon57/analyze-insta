require "open3"
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
    @st = Open3.popen3('date') do |stdin, stdout, stderr|
      stdout.read
    end
    @account = Account.find(params[:id])
    @account_posts = @account.posts

  end

  private

  def account_params
    params.require(:account).permit(:name)
  end

end
