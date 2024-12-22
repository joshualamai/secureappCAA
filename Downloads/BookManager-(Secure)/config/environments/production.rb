require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.enable_reloading = false

  # Eager load code on boot for better performance.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true

  # Ensures that a master key has been made available for decrypting credentials and other encrypted files.
  config.require_master_key = true

  # Disable serving static files from `public/`.
  config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present?

  # Compress assets to reduce their size and improve loading speed.
  config.assets.css_compressor = :sass
  config.assets.compile = false

  # Serve images, stylesheets, and JavaScripts from an asset server.
  # Uncomment and configure if using an asset host.
  # config.asset_host = "https://assets.example.com"

  # Use SSL to enforce secure connections.
  config.force_ssl = true

  # Log to STDOUT for better integration with containerized or cloud-based environments.
  config.logger = ActiveSupport::Logger.new(STDOUT)
    .tap  { |logger| logger.formatter = ::Logger::Formatter.new }
    .then { |logger| ActiveSupport::TaggedLogging.new(logger) }

  # Prepend all log lines with the following tags for better tracing.
  config.log_tags = [:request_id, :remote_ip]

  # Set logging level to avoid exposing sensitive data.
  config.log_level = :info

  # Use a different cache store in production for better performance.
  config.cache_store = :memory_store, { size: 64.megabytes }

  # Use Active Job for background processing with a queuing backend.
  config.active_job.queue_adapter = :sidekiq
  config.active_job.queue_name_prefix = "book_manager_production"

  # Configure Action Mailer for email delivery.
  config.action_mailer.perform_caching = false
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: "smtp.example.com",
    port: 587,
    domain: "example.com",
    user_name: ENV["SMTP_USERNAME"],
    password: ENV["SMTP_PASSWORD"],
    authentication: "plain",
    enable_starttls_auto: true,
  }

  # Fallback to default locale if a translation is missing.
  config.i18n.fallbacks = true

  # Disable deprecation logging in production for cleaner logs.
  config.active_support.report_deprecations = false

  # Prevent schema dump after migrations for cleaner production environments.
  config.active_record.dump_schema_after_migration = false

  # Enforce DNS rebinding protection to mitigate `Host` header attacks.
  config.hosts = ["example.com", /.*\.example\.com/] # Allow only specific domains

  # Enable strict Content Security Policy (CSP) for enhanced security.
  config.content_security_policy do |policy|
    policy.default_src :self
    policy.img_src :self, :data
    policy.script_src :self, :unsafe_inline
    policy.style_src :self, :unsafe_inline
    policy.font_src :self
    policy.connect_src :self
    policy.object_src :none
    policy.frame_src :none
  end

  # Use encrypted credentials for secure settings.
  # Example: Rails.application.credentials.smtp[:username]

  # Use a real queuing backend for Active Job in production.
  config.active_job.queue_adapter = :resque

  # Ensure Active Storage uses cloud storage in production.
  config.active_storage.service = :amazon

  # Additional security headers
  config.action_dispatch.default_headers.merge!(
    "Strict-Transport-Security" => "max-age=31536000; includeSubDomains",
    "X-Content-Type-Options" => "nosniff",
    "X-Frame-Options" => "DENY",
    "X-XSS-Protection" => "1; mode=block"
  )
end
