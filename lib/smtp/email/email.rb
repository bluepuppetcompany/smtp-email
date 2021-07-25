module SMTP
  class Email
    include Log::Dependency

    def self.build
      instance = new
      instance
    end

    def self.configure(receiver, attr_name: nil)
      attr_name ||= :smtp_email
      instance = build
      receiver.public_send("#{attr_name}=", instance)
    end

    def call(to, from, subject, body)
      mail = Mail.new

      settings = {
        :address => "localhost",
        :port => 1025
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
