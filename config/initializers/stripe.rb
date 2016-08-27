# Stripe API keys - this file initializes the Stripe API keys
# A call is made to the environment variables where the API keys are set
# The environment variables file is located at: config/application.yml
if Rails.env == 'production'
  Rails.configuration.stripe = {
    :publishable_key => ENV["STRIPE_PUBLISHABLE_KEY"],
    :stripe_api_key  => ENV["STRIPE_API_KEY"]
  }
else
  Rails.configuration.stripe = {
    :publishable_key => ENV["TEST_STRIPE_PUBLISHABLE_KEY"],
    :stripe_api_key  => ENV["TEST_STRIPE_API_KEY"]
  }
end

Stripe.api_key = Rails.configuration.stripe[:stripe_api_key]
