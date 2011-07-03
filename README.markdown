Jobtrack
========

This is a simple example Rails3 (not 3.1) app.

The basic concept is that users can sign up and enter up to 7 previous "jobs". As you might be able to tell the data models are rather skeletal, but the app shows the basic workflow and is mostly a complete rails app.

The signup workflow is slightly more complicated:

1. A user enters their email address and a unique link is emailed to the provided address.
2. This unique link, when followed, leads to a form where First Name, Last Name and account Password can be entered.
3. Upon submitting this form another is presented where the user can enter Birth Date, and Location. Also on this page the user can add or remove the aforementioned 7 jobs.

The whole app was built in BDD style using Cucumber.

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

Things I would probably refactor given time
-------------------------------------------

- The authorization code is a little clunky. In a real system, I'd probably use Devise for authentication and something like cancan for authorization
- The intial email signup shouldn't be an "account" type but should probably be a "account_lead" or something similar. This way it would make putting validations on the presense of password, first_name and last_name easier. Right now it's a little trickier so hasn't been done.
- Cucumber was used exclusively so all tests are integration tests. This is great for a "simple" application, but probably should be expanded to use Rpsec or testunit for more targetted unit tests.
- Emailing isn't really well set up, short of using a personal gmail or email account there isn't a great way around this. An email server isn't as easy to embed on a devs laptop as a database.
- The unique links are not one-time use, nor do they expire.
