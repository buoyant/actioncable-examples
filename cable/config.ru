require ::File.expand_path('../../config/environment',  __FILE__)
Rails.application.eager_load!
# ActionCable.server.config.disable_request_forgery_protection = true # used when action cable websocket runs with puclic ip.
run ActionCable.server
