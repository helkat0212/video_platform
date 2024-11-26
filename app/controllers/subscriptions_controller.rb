class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def show
    @subscription = Subscription.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to subscriptions_path, alert: "Subscription not found."
  end
  
  def index
    @subscriptions = current_user.subscriptions.includes(:channel) # Load subscriptions for the current user
  end
end