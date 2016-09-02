class SubscriptionsController < ApplicationController
  before_action :disable_nav, only: [:plans]
  before_action :authenticate_admin!

    def plans
    end

    def create
      token = params[:stripeToken]
      plan_id = params[:plan_id]
      plan = Stripe::Plan.retrieve(plan_id)

      customer = Stripe::Customer.create(
        :source => token,
        :plan => plan,
        :email => params[:stripeEmail]
      )

      @location.subscribed = true
      @location.stripe_id = customer.id
      @location.plan_id = plan_id
      @location.save

      flash[:success] = "Thank you for subscribing!"
      redirect_to dashboard_path
    end

end
