module SMTP
  class Email
    module Telemetry
      class Sink
        include ::Telemetry::Sink

        record :sent
      end

      def self.sink
        Sink.new
      end

      Data = Struct.new(:to, :from, :subject)
    end

    def self.register_telemetry_sink(receiver)
      sink = Telemetry.sink
      receiver.telemetry.register(sink)
      sink
    end
  end
end
