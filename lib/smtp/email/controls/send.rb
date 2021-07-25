module SMTP
  class Email
    module Controls
      class Send
        def self.call(
          to: nil,
          from: nil,
          subject: nil,
          body: nil
        )
          to ||= Email.to
          from ||= Email.from
          subject ||= Email.subject
          body ||= Email.body

          smtp_email = SMTP::Email.build
          smtp_email.(to, from, subject, body)
        end
      end
    end
  end
end
