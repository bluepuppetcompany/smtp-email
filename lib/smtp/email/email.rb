module SMTP
  class Email
    include Dependency
    include Log::Dependency
    include Settings::Setting

    dependency :telemetry, ::Telemetry

    setting :address
    setting :port

    def self.build(settings: nil)
      instance = new
      settings ||= Settings.instance
      settings.set(instance)
      instance.configure
      instance
    end

    def self.configure(receiver, settings: nil, attr_name: nil)
      attr_name ||= :smtp_email
      instance = build(settings: settings)
      receiver.public_send("#{attr_name}=", instance)
    end

    def configure
      ::Telemetry.configure(self)
    end

    def call(to, from, subject, body)
      send_email(to, from, subject, body)

      telemetry.record(:sent, Telemetry::Data.new(to, from, subject))
    end

    def send_email(to, from, subject, body)
      mail = Mail.new

      settings = {
        :address => address,
        :port => port
      }

      logger.trace(tag: :delivery_method) { "Building delivery method... (Settings: #{settings})" }

      mail.delivery_method(
        :smtp,
        settings
      )

      logger.trace { "Sending email... (To: #{to}, From: #{from}, Subject: #{subject})" }

      mail.to = to
      mail.from = from
      mail.subject = subject
      mail.body = body

      mail.deliver

      logger.debug { "Sent email. (To: #{to}, From: #{from}, Subject: #{subject})" }
    end
  end
end
