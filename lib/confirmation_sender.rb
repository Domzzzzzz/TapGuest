# This module uses the CodeGenerator module to generate random code
# then updates verification.pin with the code generated
# then uses the MessageSender module to send an SMS containing the code
module ConfirmationSender
  def self.send_confirmation_to(verification)
    pin = CodeGenerator.generate
    verification.update(pin: pin)
    MessageSender.send_code(verification.cell, pin)
  end
end
