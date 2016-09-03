class SubscriptionsController < ApplicationController
  before_action :disable_nav, only: [:plans]
  before_action :authenticate_admin!
  before_action :admin_only

    def plans
    end

    def create
      token = params[:stripeToken]
      plan_id = params[:plan_id]
      plan = Stripe::Plan.retrieve(plan_id)

      case plan_id
        when "free_plan"
          @parties = 25
        when "silver_plan"
          @parties = 500
        when "gold_plan"
          @parties = 1200
        when "platinum_plan"
          @parties = 2000
      end

      if plan_id == 'unlimited_plan'
        customer = Stripe::Customer.create(
          :source => token,
          :plan => plan,
          :email => params[:stripeEmail]
        )
      else
        customer = Stripe::Customer.create(
          :source => token,
          :plan => plan,
          :email => params[:stripeEmail],
          :metadata => { 'parties' => @parties }
        )
      end

      @location.subscribed = true
      @location.stripe_id = customer.id
      @location.plan_id = plan_id
      @location.save

      flash[:success] = "Thank you for subscribing!"
      redirect_to dashboard_path
    end

end
