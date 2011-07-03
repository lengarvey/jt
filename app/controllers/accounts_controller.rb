class AccountsController < ApplicationController
  before_filter :load_account, :except => [:index, :create, :signup_with_uuid]
  
  def load_account
    @account = Account.find(params[:id])
  end
  
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
    if params[:account][:flash]
      flash_array = []
      flash_array << ["Password updated"] if params[:account][:password].length > 0 
      flash_array << ["First name updated"] unless params[:account][:first_name] == @account.first_name
      flash_array << ["Last name updated"] unless params[:account][:last_name] == @account.last_name
      flash_array << ["Location updated"] unless params[:account][:location] == @account.location 
      flash_array << ["Birth date updated"] unless params[:account][:birth_date] == @account.birth_date.to_s
      flash[:notice] = flash_array.join("<br/>") if flash_array.count > 0
    end

    if not @account.update_attributes(params[:account])
      flash[:notice] = nil
    end
    redirect_to account_path(@account)
  end

  def show
  end

  def edit
      
  end
end
