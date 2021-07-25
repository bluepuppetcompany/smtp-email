require_relative './interactive_init'

to = "jane@example.com"
from = "john@example.com"
subject = "Hello!"
body = "How are you today? This is a test body!"

Controls::Send.(
  to: to,
  from: from,
  subject: subject,
  body: body
)
