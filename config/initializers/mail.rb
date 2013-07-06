if Rails.env.production?
  # only send emails for real in prod
  ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.sendgrid.net',
    :port           => '587',
    :authentication => :plain,
    :user_name      => ENV['SENDGRID_USERNAME'],
    :password       => ENV['SENDGRID_PASSWORD'],
    :domain         => 'heroku.com'
  }
  ActionMailer::Base.delivery_method ||= :smtp
elsif Rails.env.development?
  # hey, did you hear about letter opener? Install it in your gemfile.
  ActionMailer::Base.delivery_method = :letter_opener
end