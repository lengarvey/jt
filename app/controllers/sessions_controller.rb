class SessionsController < ApplicationController
  def new
  end
      
  def create  
    account = Account.authenticate(params[:useremail], params[:password])  
    if account  
      session[:account_id] = account.id  
      redirect_to account_path(account), :notice => "Logged in!"  
    else  
      flash.now.alert = "Invalid email or password"  
      render "new"
    end  
  end

end
