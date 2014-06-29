 Rails.application.config.middleware.use OmniAuth::Builder do
   provider :facebook, {:client_options => {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}}}, :strategy_class => OmniAuth::Strategies::Facebook
 end