class AccountsController < ApplicationController
  def index
    @account = Account.new
  end

  def create
    @account = Account.new(params[:account])
    @account.save
    flash[:notice] = "Thankyou for signing up, an email has been sent to #{@account.email}."
    redirect_to :root
  end
end
