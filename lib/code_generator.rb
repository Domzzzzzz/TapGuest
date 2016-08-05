# This module generates a random 4 digit code for Twilio SMS verification
module CodeGenerator
  def self.generate
    rand(1000...9999).to_s
  end
end
