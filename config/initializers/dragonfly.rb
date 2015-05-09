require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "cadbca61e3643d9d78c1b1698b3fb9a91e11c9c1945edcd6206f4daee7fa2dad"

  url_format "/media/:job/:name"

  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
