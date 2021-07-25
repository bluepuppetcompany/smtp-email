require_relative './automated_init'

context "Telemetry" do
  to = Controls::Email.to
  from = Controls::Email.from
  subject = Controls::Email.subject
  body = Controls::Email.body

  smtp_email = SMTP::Email::Substitute.build

  smtp_email.(to, from, subject, body)

  sink = smtp_email.sink

  test "Records sent signal" do
    recorded = sink.recorded_once? do |record|
      record.signal == :sent
    end

    assert(recorded)
  end

  context "Recorded Attributes" do
    test "To" do
      recorded = sink.recorded_sent? do |record|
        record.data.to == to
      end

      assert(recorded)
    end

    test "From" do
      recorded = sink.recorded_sent? do |record|
        record.data.from == from
      end

      assert(recorded)
    end

    test "Subject" do
      recorded = sink.recorded_sent? do |record|
        record.data.subject == subject
      end

      assert(recorded)
    end
  end
end
