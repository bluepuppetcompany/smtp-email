module SMTP
  class Email
    class Log < ::Log
      def tag!(tags)
        tags << :smtp_email
      end
    end
  end
end
