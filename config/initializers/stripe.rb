Rails.configuration.stripe = {
  #:publishable_key => ENV['PUBLISHABLE_KEY'],
  #:secret_key      => ENV['SECRET_KEY']
  :publishable_key => 'pk_test_E1tQRVpz2GB5QfyGSnI22P7R',
  :secret_key      => 'sk_test_Qi8ZIN0EkNRLxcKcqcWYk7vA'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
