# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add the Admin theme to assets path
Rails.application.config.assets.paths << Rails.root.join('vendor')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( game_control.css )
# TODO remove these
Rails.application.config.assets.precompile += %w( AdminLTE/dist/img/user2-160x160.jpg )
Rails.application.config.assets.precompile += %w( AdminLTE/plugins/jQuery/jQuery-2.1.4.min.js )
Rails.application.config.assets.precompile += %w( AdminLTE/bootstrap/js/bootstrap.min.js )
Rails.application.config.assets.precompile += %w( AdminLTE/dist/js/app.min.js )
