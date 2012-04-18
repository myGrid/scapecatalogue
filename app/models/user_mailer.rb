# BioCatalogue: app/models/user_mailer.rb
#
# Copyright (c) 2008-2010, University of Manchester, The European Bioinformatics
# Institute (EMBL-EBI) and the University of Southampton.
# See license.txt for details

class UserMailer < ActionMailer::Base
  def registration_notification(user, base_url)
    content_type "text/plain"
    recipients  user.email
    from        SENDER_EMAIL_ADDRESS
    subject     "[#{SITE_NAME}] Please activate your new account"
    body        :user => user,
                :base_url => base_url
  end

  def reset_password(user, base_url)
    content_type "text/plain"
    recipients  user.email
    from        SENDER_EMAIL_ADDRESS
    subject     "[#{SITE_NAME}] Resetting your password - Step 2"
    body        :user => user,
                :base_url => base_url
  end
  
  def testscript_status_notification(user, base_url, testscript)
    content_type "text/html"
    recipients  user.email
    from        SENDER_EMAIL_ADDRESS
    subject     "[#{SITE_NAME}] Your test script status changed "
    body        :user => user,
                :base_url => base_url,
                :test_script => testscript
    
  end
  
  def responsibility_request_notification(owner, base_url, service, user)
    content_type "text/html"
    recipients  owner.email
    from        SENDER_EMAIL_ADDRESS
    subject     "[#{SITE_NAME}] Service Reponsibility Request"
    body        :owner => owner,
                :base_url => base_url,
                :service => service,
                :user => user # user is the one making the request
    
  end
  
  def responsibility_request_cancellation(owner, base_url, service, user, req)
    content_type "text/html"
    recipients  owner.email
    from        SENDER_EMAIL_ADDRESS
    subject     "[#{SITE_NAME}] Service Reponsibility Request Cancellation"
    body        :owner => owner,
                :base_url => base_url,
                :service => service,
                :user => user, # user is the one cancelling the request
                :req => req
    
  end
  
  def responsibility_request_approval(owner, base_url, service, user, req )
    content_type "text/html"
    recipients  owner.email
    from        SENDER_EMAIL_ADDRESS
    subject     "[#{SITE_NAME}] Service Reponsibility Approved"
    body        :owner => owner,
                :base_url => base_url,
                :service => service,
                :user => user, # user is the one approving the request
                :req => req
    
  end
  
  def responsibility_request_refusal(owner, base_url, user, req)
    content_type "text/html"
    recipients  owner.email
    from        SENDER_EMAIL_ADDRESS
    subject     "[#{SITE_NAME}] Service Reponsibility Request Turned Down"
    body        :owner => owner,
                :base_url => base_url,
                :service => req.subject,
                :user => user ,# user is the one turning down the request
                :req => req
    
  end
  
  def claimant_responsibility_notification(user, base_url, service)
    content_type "text/html"
    recipients  user.email
    from        SENDER_EMAIL_ADDRESS
    subject     "[#{SITE_NAME}] Your request to take responsibility for a Service"
    body        :user => user,
                :base_url => base_url,
                :service => service
  end

  def orphaned_provider_notification(user_emails, base_url, provider)
    content_type "text/html"
    recipients  user_emails
    from        SENDER_EMAIL_ADDRESS
    subject     "[#{SITE_NAME}] The system has a Service Provider with no services"
    body        :base_url => base_url,
                :provider => provider
  end
  
  def service_test_disable_notification(user, service_test, to_emails, base_url)
    content_type "text/html"
    recipients  to_emails
    from        SENDER_EMAIL_ADDRESS
    subject     "[#{SITE_NAME}] A service test has been disabled! "
    body        :user => user,
                :service_test => service_test,
                :base_url => base_url
  end
  
end
