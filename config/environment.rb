# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Bootprod::Application.initialize!

ActionMailer::Base.delivery_method = :smtp

mail_options = {
	:address    => "smtp.mandrillapp.com",
	:port       => 587,
	:user_name  => ENV["MANDRILL_USERNAME"],
	:password   => ENV["MANDRILL_PASSWORD"],
	:enable_ssl => true
}

Mail.defaults do
	delivery_method :smtp, mail_options
end
