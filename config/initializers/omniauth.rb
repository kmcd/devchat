Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  provider :github, '6c4a802910747d2c6cfe',
    'f14ca608c96dbc282742c5aa7db868a4f2fd2e3a'
end

OmniAuth.config.logger = Rails.logger
