module SMTP
  class Email
    class Settings < ::Settings
      def self.instance
        @instance ||= build
      end

      def self.data_source
        Defaults.data_source
      end

      module Defaults
        def self.data_source
          "settings/smtp_email.json"
        end
      end
    end
  end
end
