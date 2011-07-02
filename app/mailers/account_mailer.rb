class AccountMailer < ActionMailer::Base
  default :from => "job-track@example.com"

  def request_activation(account)
    @account = account
    link = @account.activation_links.build
    link.uuid = UUIDTools::UUID.timestamp_create.to_s
    link.save
    @url = accounts_url + '/signup/' + link.uuid

    mail :to => @account.email, :subject => "Job-track activation"
  end
end
