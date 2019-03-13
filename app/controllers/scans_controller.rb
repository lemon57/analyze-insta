class ScansController < ApplicationController
  def new
    @scan = Scan.new
    # @acc = Account.find_by(username: Scan.last.name)
  end

  def create
    @scan = Scan.new(scan_params)
    @scan.save
    check
    redirect_to root_path

    @acc = Account.find_by(username: Scan.last.name)
  end

  def check
   if Account.exists?(username: @scan.name)
    flash[:notice] = "This account exist in our DB!"
   else
    flash[:notice] = "This account doesn't exist in our DB!"
   end
  end

  private

  def scan_params
    params.require(:scan).permit(:name)
  end
end
