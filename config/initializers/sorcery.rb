Rails.application.config.sorcery.submodules = [:reset_password, :external]

Rails.application.config.sorcery.configure do |config|
  config.user_config do |user|
    user.stretches = 1 if Rails.env.test?
    user.reset_password_mailer = UserMailer
    user.authentications_class = Authentication
  end
  
  config.user_class = "User"

  config.external_providers = [:google]

  config.google.key = ENV['GOOGLE_CLIENT_ID']
  config.google.secret = ENV['GOOGLE_CLIENT_SECRET']
  config.google.callback_url = Rails.env.production? ? 
                              "https://an-connect.com/oauth/callback?provider=google" : 
                              "http://localhost:3000/oauth/callback?provider=google"
  config.google.user_info_mapping = { email: 'email', name: 'name' }
end