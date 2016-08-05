# This module calls the environment variables containing Twilio credentials
# Twilio Credentials located at: config/application.yml
# Then sends the generated code to the admin's phone number
module MessageSender
  def self.send_code(cell, pin)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token  = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)

    message = client.messages.create(
      from:  ENV['TWILIO_NUMBER'],
      to:    cell,
      body:  pin
    )

    message.status == 'queued'
  end
end
