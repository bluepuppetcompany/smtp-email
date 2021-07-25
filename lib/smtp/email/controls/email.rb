module SMTP
  class Email
    module Controls
      module Email
        def self.to
          "recipient@example.com"
        end

        def self.from
          "sender@example.com"
        end

        def self.subject
          "Test subject"
        end

        def self.body
          "Test body!"
        end
      end
    end
  end
end
