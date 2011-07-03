class JobsController < ApplicationController
  before_filter :get_account
  def get_account
    @account = Account.find_by_id(params[:account_id])
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
