Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, domain: 'http://bitlist-io.herokuapp.com'
end