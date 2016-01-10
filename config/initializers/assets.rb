# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add the Admin theme to assets path
Rails.application.config.assets.paths << Rails.root.join('vendor')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( game_control.css
                                                  game_control.js
                                                  game_control_footer.js
                                                  analytics.js
                                              )
