class JobsController < ApplicationController
  before_filter :authorize

  def load_account
    @account = Account.find(params[:account_id])
  end

  def authorize
    load_account
    redirect_to new_session_path, :notice => 'You need to log in' unless @account.id == session[:account_id]
  end

  def new
    @job = @account.jobs.build
  end

  def create
    @job = @account.jobs.build
    if @job.update_attributes(params[:job])
      redirect_to @account
    else
      render 'accounts/show'
    end
  end
  def destroy
    Job.find_by_id(params[:id]).destroy 
    flash[:notice] = "Job removed"
    redirect_to @account
  end
end
