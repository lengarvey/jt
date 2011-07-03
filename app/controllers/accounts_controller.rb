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
      render :index
    end
  end

  def signup_with_uuid 
    @account = ActivationLink.find_by_uuid(params[:uuid]).account
  end

  def update
    @account = Account.find(params[:id])
    @account.update_attributes(params[:account])
    render :add_jobs
  end
end
