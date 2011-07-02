class AccountsController < ApplicationController
  def index
    @account = Account.new
  end

  def create
    @account = Account.new(params[:account])
    if @account.save
      flash[:notice] = "Thankyou for signing up, an email has been sent to #{@account.email}."
      AccountMailer.request_activation(@account).deliver
      redirect_to :root
    else
      redirect_to :root
    end
  end

  def signup_with_uuid 
    render
  end
end
