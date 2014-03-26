load Rails.root.join('config/environments/production.rb')

Demo::Application.configure do
  config.assets.compile = true
  config.log_level = :debug
end
