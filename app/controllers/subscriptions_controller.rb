class SubscriptionsController < ApplicationController
  before_action :disable_nav, only: [:plans]
  before_action :admin_only

    def plans
    end

    def edit
      subscription = Stripe::Subscription.retrieve(@location.subscription_id)
      @subscription_start = subscription.current_period_start
      @subscription_end = subscription.current_period_end
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
      elsif plan_id == 'free_plan'
        customer = Stripe::Customer.create(
          :plan => plan,
          :email => current_admin.email,
          :metadata => { 'parties' => @parties }
        )
      else
        customer = Stripe::Customer.create(
          :source => token,
          :plan => plan,
          :email => params[:stripeEmail],
          :metadata => { 'parties' => @parties }
        )
      end

      subscription = Stripe::Subscription.create(
        :customer => customer,
        :plan => plan
        )

      @location.subscribed = true
      @location.stripe_id = customer.id
      @location.plan_id = plan_id
      @location.subscription_id = subscription.id
      @location.parties = @parties
      @location.save

      flash[:success] = "Thank you for subscribing!"
      redirect_to dashboard_path
    end

end
