module SMTP
  class Email
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

      mail.delivery_method(
        :smtp,
        settings
      )

      mail.to = to
      mail.from = from
      mail.subject = subject
      mail.body = body

      mail.deliver
    end
  end
end
