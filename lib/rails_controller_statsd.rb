require "rails_controller_statsd/version"

module RailsControllerStatsd
  class Middleware

    # Initializes the middleware.
    #
    # @param app           The next Rack app in the pipeline.
    # @param statsd_client Statsd client - optional
    # @param stats_prefix  Prefix for the metrics - optional
    def initialize(app, statsd_client = nil, stats_prefix = '')
      @app = app
      @statsd_client = statsd_client
      @stats_prefix = stats_prefix
    end

    # Rack entry point.
    #
    # @param env [Hash] The next Rack app in the pipeline.
    def call(env)
      controller_info = get_controller_info(env)

      unless @statsd_client.nil? || controller_info.empty?
        record_hit(controller_info)
      end

      @app.call(env)
    end

    # Increment the counter for the controller and action
    #
    # @param controller_info [Hash] { controller: 'controller', action: 'action'}
    def record_hit(controller_info)
      @statsd_client.increment counter(controller_info)
    end

    # Takes controller and action information and return the counter string
    #
    # @param controller_info [Hash] { controller: 'controller', action: 'action'}
    # @return [String]
    def counter(controller_info)
      prefix = if @stats_prefix
                 "#{@stats_prefix}."
               else
                 ''
               end

      prefix + "#{controller_info[:controller].gsub('/','.')}.#{controller_info[:action]}"
    end

    # Takes the Rack information and return the Rails Controller and Action
    #
    # @param env [Hash] The next Rack app in the pipeline.
    # @return [Hash]
    def get_controller_info(env)
      request = Rack::Request.new(env)
      (Rails.application.routes.recognize_path(request.path, { method: env['REQUEST_METHOD'] }) rescue {}) || {}
    end
  end
end
