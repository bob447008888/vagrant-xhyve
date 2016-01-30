module VagrantPlugins
  module Xhyve
    class Provider < Vagrant.plugin('2', :provider)
      def initialize(machine)
        @machine = machine
      end

      def self.installed?
        Driver.new
        true
      rescue Errors::XhyveNotDetected
        return false
      end

      def self.usable?(raise_error=false)
        Driver.new
        true
      rescue Errors::XhyveNotDetected
        raise if raise_error
        false
      end

      def action(name)
        action_method = "action_#{name}"
        if Action.respond_to?(action_method)
          Action.send(action_method)
        end
      end

      def ssh_info
        # TODO
      end

      def state
        # TODO
      end
    end
  end
end
