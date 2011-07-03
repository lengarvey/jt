Jobtrack
========

This is a simple example Rails3 (not 3.1) app.

The basic concept is that users can sign up and enter up to 7 previous "jobs". As you might be able to tell the data models are rather skeletal, but the app shows the basic workflow and is mostly a complete rails app.

How to run
----------

clone this repository 
```    
git clone https://github.com/lengarvey/jt
```

You probably want to setup a new gemset, or use a compatible one using rvm. Once you've done that type:

```
cd jt
bundle install
rake db:setup
rails s
```

Then navigate your browser to: http://localhost:3000

The email setup is fairly crude, so unless you have sendmail configured on the machine you're going to run this on you'll need to read the activation link from the rails log. When you enter an email you'll get output as follows in the rails s output window:

```
Sent mail to tester2@test.com (10ms)
Date: Sun, 03 Jul 2011 23:28:55 +1000
From: job-track@example.com
To: tester2@test.com
Message-ID: <4e106e977ead0_3772819d1fe45946f@perseus.local.mail>
Subject: Job-track activation
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
 Content-Transfer-Encoding: 7bit

 Thanks for signing up, visit the following url to continue your activation: 

 http://localhost:3000/accounts/signup/66788afa-a578-11e0-9396-1093e910240c
```

If you were to deploy this app you might have something like the following code in your production.rb file:

```ruby
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
:tls => true,
:address => “smtp.gmail.com”,
:port => 587,
:domain => YOURDOMAINNAME,
:authentication => :plain,
:user_name => GMAILUSERNAME,
:password => GMAILPASSWORD
}
```

To run tests
------------
```
rake cucumber
```
