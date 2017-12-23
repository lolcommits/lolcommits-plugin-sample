require 'lolcommits/plugin/base'

module Lolcommits
  module Plugin
    class SamplePlugin < Base

      ##
      # Returns the name of the plugin.
      #
      # Identifies the plugin to lolcommits. This should be uniq and
      # descriptive.
      #
      # @return [String] the plugin name
      #
      def self.name
        'plugin-sample'
      end

      # Returns position(s) of when this plugin should run during the capture
      # process.
      #
      # Defines when the plugin will execute in the capture process. This must
      # be defined, if the method returns nil, or [] the plugin will never run.
      # Three hook positions exist, your plugin code can execute in one or more
      # of these.
      #
      # @return [Array] the position(s) (:pre_capture, :post_capture,
      # :capture_ready)
      #
      def self.runner_order
        [:pre_capture, :post_capture, :capture_ready]
      end

      ##
      #
      # Plugin initializer
      #
      # @param runner [Lolcommits::Runner] a instance of a lolcommits runner
      # @param config [Lolcommits::Configuration] (optional)
      #
      # The default superclass method sets @runner and @config instance vars and
      # the default plugin option key `@options = ['enabled']`. `@runner.config`
      # is used if no `config` parameter is passed.
      #
      # Override this method to change the default options, or assign any useful
      # variables necessary for the plugin to run.
      #
      def initialize(runner: nil, config: nil)
        super
      end

      ##
      #
      # Pre-capture hook, runs before lolcommits captures a snapshot.
      #
      # Override this method to execute plugin code before the lolcommit
      # snapshot is captured.
      #
      # Prints a short (emoji themed) message to STDOUT
      #
      def run_pre_capture
        puts "✨  Say cheese 😁 !"
      end

      ##
      #
      # Post-capture hook, run after lolcommits captures a snapshot.
      #
      # Override this method to execute plugin code after the lolcommit
      # snapshot is captured.
      #
      # Prints a short (emoji themed) message to STDOUT
      #
      def run_post_capture
        puts "📸  Snap "
      end

      ##
      #
      # Capture ready hook, runs after lolcommits captures a snapshot.
      #
      # Override this method to execute plugin code after the lolcommit snapshot
      # is captured and all image processing in post capture hooks (from other
      # plugins) has completed
      #
      # Prints a short (emoji themed) message to STDOUT with the current commit
      # sha.
      #
      def run_capture_ready
        puts "✨  wow! #{self.runner.sha} is your best looking commit yet! 😘  💻"
      end

      ##
      # Returns true/false indicating if the plugin is enabled or not.
      #
      # The default superclass method will return true if the enabled option is
      # true  e.g. configuration['enabled'] == true
      #
      # Override this method to define your own custom enabled logic. E.g. check
      # for valid or required configuration options to be set. If this method
      # always returns true, the only way to disable the plugin will be to
      # uninstall the gem.
      #
      # @return [Boolean] true/false indicating if plugin is enabled
      #
      def enabled?
        super
      end

      ##
      # Prompts the user to configure the plugin's options.
      #
      # The default superclass method will iterate over the @options array and
      # build a configuration hash, prompting for user input on each option key.
      #
      # Lolcommits will save this configuration hash to its default config file
      # (YAML). This config Hash is loaded and parsed during the capturing
      # process and available in this plugin class via the configuration method.
      #
      # Override this method to define your own configuration flow. A helpful
      # parse_user_input method is available to help parse strings from STDIN.
      #
      # @return [Hash] a hash of configured plugin options
      #
      def configure_options!
        super
      end

      ##
      # Returns true/false indicating if the plugin has been correctly
      # configured.
      #
      # The default superclass method calls configured?. When false a message is
      # shown explaining the plugin has not yet been configured, with help on
      # how to configure it.
      #
      # Override this method to define your own configuration checks and
      # messaging.
      #
      # This method must return true for the plugin to execute. It is checked by
      # the lolcommits runner prior to running a pre or post capture hook.
      #
      # @return [Boolean] true/false indicating if plugin is correct configured
      #
      def valid_configuration?
        super
      end

      ##
      # Returns true/false indicating if the plugin has been configured.
      #
      # The default superclass method checks if the configuration hash is empty.
      # Override this method to define your own check on whether configuration
      # has taken place.
      #
      # @return [Boolean] true/false indicating if plugin has been configured
      #
      def configured?
        super
      end
    end
  end
end
