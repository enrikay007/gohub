Rails.application.configure do
  
  config.cache_classes = false

  config.eager_load = false

  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  config.action_mailer.raise_delivery_errors = true

  config.active_support.deprecation = :log

  config.active_record.migration_error = :page_load

  config.assets.debug = true

  config.assets.digest = true

  config.assets.raise_runtime_errors = true


  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

  config.action_mailer.delivery_method=:smtp
  config.action_mailer.smtp_settings={
    address:'in-v3.mailjet.com',
    port: 587,
    enable_starttls_auto:true,
    user_name: '4662af4e9a3641bb40983a6e5b50b66e',
    password: '32f5e3a2acb4ce11d6535947c0ded59c',
    authentication: 'login'

  }
  
  
end

Paperclip.options[:command_path] = 'C:\Program Files (x86)\GnuWin32\bin'
