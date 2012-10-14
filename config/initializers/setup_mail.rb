ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "mybestdrink.com",
  :user_name            => "mustache",
  :password             => "mustachio!",
  :authentication       => "plain",
  :enable_starttls_auto => true
}