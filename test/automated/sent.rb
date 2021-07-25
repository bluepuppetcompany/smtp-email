require_relative './automated_init'

context "Sent" do
  to = Controls::Email.to
  from = Controls::Email.from
  subject = Controls::Email.subject
  body = Controls::Email.body

  smtp_email = SMTP::Email::Substitute.build

  smtp_email.(to, from, subject, body)

  context "Recorded Attributes" do
    test "To" do
      sent = smtp_email.sent? do |sent_to|
        sent_to == to
      end

      assert(sent)
    end

    test "From" do
      sent = smtp_email.sent? do |sent_to, sent_from|
        sent_from == from
      end

      assert(sent)
    end

    test "Subject" do
      sent = smtp_email.sent? do |sent_to, sent_from, sent_subject|
        sent_subject == subject
      end

      assert(sent)
    end
  end
end
