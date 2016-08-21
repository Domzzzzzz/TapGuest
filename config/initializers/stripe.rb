# Stripe API keys - this file initializes the Stripe API keys
# A call is made to the environment variables where the API keys are set
# The environment variables file is located at: config/application.yml
if Rails.env == 'production'
  Rails.configuration.stripe = {
    :publishable_key => ENV["test_stripe_publishable_key"],
    :stripe_api_key  => ENV["test_stripe_api_key"]
  }
else
  Rails.configuration.stripe = {
    :publishable_key => ENV["stripe_publishable_key"],
    :stripe_api_key  => ENV["stripe_api_key"]
  }
end

Stripe.api_key = Rails.configuration.stripe[:stripe_api_key]
