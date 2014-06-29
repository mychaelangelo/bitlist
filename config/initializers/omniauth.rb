 Rails.application.config.middleware.use OmniAuth::Builder do
 #   provider :facebook, {:client_options => {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}}}
   provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']

   on_failure { |env| SessionsController.action(:failure).call(env) }
 end